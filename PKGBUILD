# Maintainer: aereaux <aidan@jmad.org>
# Contributor: peippo <christoph.fink@gmail.com>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python2-tokenserver
_pkgname=tokenserver

pkgdesc="Mozilla Token Server"
url="https://github.com/mozilla-services/tokenserver"

pkgver=1.5.0
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
sha512sums=('f1e8602d8205c38be0d532adb1f064e2daafbcd70ddb2bed829b192df7b1664c9d798450b9184a09dc7d39bdc57b861db831ed05671088958c69b91db8c049aa')

build(){
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
