# Maintainer: peippo <christoph.fink@gmail.com>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python2-tokenserver
_pkgname=tokenserver

pkgdesc="Mozilla Token Server"
url="https://github.com/mozilla-services/tokenserver"

pkgver=1.3.1
pkgrel=0

arch=("any")
license=("MPL2")

depends=(
    "python2"
    "python2-browserid"
    "python2-cornice"
    "python2-pymysql-sa"
    "python2-setuptools"
)

source=("https://github.com/mozilla-services/tokenserver/archive/${pkgver}.tar.gz")
sha512sums=("fc0396e9cefc7ba5bcaa91ed3975d4479c3e70036fd9c50a3031aaa80ef9bdd44cdfd4e95b2516a9e89240c9bda30a3336dbcf84d6680d9bfa908511ed7e05a4")

build(){
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
