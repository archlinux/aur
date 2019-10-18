# Maintainer: aereaux <aidan@jmad.org>
# Contributor: peippo <christoph.fink@gmail.com>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python2-tokenserver
_pkgname=tokenserver

pkgdesc="Mozilla Token Server"
url="https://github.com/mozilla-services/tokenserver"

pkgver=1.4.3
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
sha512sums=('f6b535779456131c02b35fb15ba176660fb15e8a3643ed5865c454032c0fa006f0927cee0f138daec93cf003f1966c66cc051ad828e63646be894123eaa04a29')

build(){
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
