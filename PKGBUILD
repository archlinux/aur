# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=python-labml
pkgver=0.4.162
pkgrel=1
pkgdesc="Monitor deep learning model training and hardware usage from mobile."
url="https://github.com/labmlai/labml"
arch=('any')
provides=('python-labml')
depends=('python' 'python-gitpython' 'python-numpy' 'python-yaml')
makedepends=('python-setuptools')
_name="${pkgname#python-}"
_commit="f93d3552ba69664db70e853af017561c9b72499a"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/labmlai/labml/$_commit/readme.md")
sha256sums=('1abec8fb9343e05ab2cb2ed27eca586923176ccfa4b035ae8aa972933fb05494'
            'bc8d6a267657885892951bcb5043b9a672f04e9a1f1e72bc8cdc05fcc19b578b')

build() {
  cd "$srcdir/$_name-$pkgver"
  cp ../readme.md .
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
