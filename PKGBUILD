# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname='pgzero'
pkgname='python-pgzero'
pkgver=1.2.post5
pkgrel=2
pkgdesc="A zero-boilerplate 2D games framework"
url="http://pypi.python.org/pypi/pgzero"
depends=('python-numpy' 'python-pygame')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("${_pkgname}-${pkgver}.zip::https://github.com/lordmauve/pgzero/archive/${pkgver}.zip")
md5sums=('8c2146a6dd244ab71e84a632c09b3f08')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  sed -i -e "s|pygame[^']*|pygame|" setup.py
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
