# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=python-labml
pkgver=0.5.3
pkgrel=1
pkgdesc="Monitor deep learning model training and hardware usage from mobile."
url="https://github.com/labmlai/labml"
arch=('any')
provides=('python-labml')
depends=('python' 'python-gitpython' 'python-numpy' 'python-yaml')
makedepends=('python-setuptools')
_name="${pkgname#python-}"
_commit="c3b3ccce4bb74df898563d00b0af83f0d4ca2223"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/labmlai/labml/$_commit/readme.md")
sha256sums=('a04ad3a2d45cab9bde59f70f9897b43f3b55dbe690fdcef2461d11d2dc1b005a'
            '68e5a1ace44d3d1d004a3ae93100cfc16d472d2ef1202138878a1ff1f18b7ce2')

build() {
  cd "$srcdir/$_name-$pkgver"
  cp ../readme.md .
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
