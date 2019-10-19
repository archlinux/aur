# Maintainer: aereaux <aidan@jmad.org>
# Contributor: peippo <christoph.fink@gmail.com>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python2-tokenserver
_pkgname=tokenserver

pkgdesc="Mozilla Token Server"
url="https://github.com/mozilla-services/tokenserver"

pkgver=1.4.4
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
sha512sums=('4be32b79c8159b957a34797c5dd043cf41867e2ce7a2e56d7483dafe5981e49a3c56698664cc7141b4cf1d672407951f7088ad3ddd6102e9d0a1023d6e3d52c7')

build(){
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
