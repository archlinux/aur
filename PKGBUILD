# Maintainer: aereaux <aidan@jmad.org>
# Contributor: peippo <christoph.fink@gmail.com>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python2-tokenserver
_pkgname=tokenserver

pkgdesc="Mozilla Token Server"
url="https://github.com/mozilla-services/tokenserver"

pkgver=1.4.2
pkgrel=1

arch=("any")
license=("MPL2")

depends=(
    "python2"
    "python2-browserid"
    "python2-cornice-0.16.2"
    "python2-pymysql-sa"
    "python2-setuptools"
    "python2-fxa"
)

source=("https://github.com/mozilla-services/tokenserver/archive/${pkgver}.tar.gz")
sha512sums=('7e416f80d5c0a67c4120989682b15e9ffcf18c0d4674703c858255ef42b1c66feba8efb8814201c30f2eb79ac0703cc54d64f645b42a105087449230aa406d62')

build(){
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
