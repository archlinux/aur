# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=python-labml
pkgver=0.4.152
pkgrel=1
pkgdesc="Monitor deep learning model training and hardware usage from mobile."
url="https://github.com/labmlai/labml"
arch=('any')
provides=('python-labml')
depends=('python' 'python-gitpython' 'python-numpy' 'python-yaml')
makedepends=('python-setuptools')
_name="${pkgname#python-}"
_commit="9b51c8494b4e9ef008cf30f85d626fee3a3028bf"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/labmlai/labml/$_commit/readme.md")
sha256sums=('13a2a206194b0a5a7c4e9fe59972b8682897446b4c58cb251c26d2c52e4367a7'
            '52ce96a13aa600f28d49644d94a0e3d3223957c642c4878fadc1b6dfe9874b6e')

build() {
  cd "$srcdir/$_name-$pkgver"
  cp ../readme.md .
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
