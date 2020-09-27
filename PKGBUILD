# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=python2-apsw
pkgver=3.33.0
pkgrel=2
_pkgrel="r1"
_pkgver="${pkgver}-${_pkgrel}"
pkgdesc="Python 2 wrapper for SQLite"
arch=("x86_64")
url="https://github.com/rogerbinns/apsw"
license=("GPL")
depends=("python2" "sqlite")
makedepends=("python2-setuptools")
conflicts=("${pkgname}" "${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/${_pkgver}.tar.gz")
md5sums=("d729fd27a50394ce584931a44ad01834")

build() {
  cd "${srcdir}/apsw-${_pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/apsw-${_pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
