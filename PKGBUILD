# Maintainer: aereaux <aidan@jmad.org>
# Contributor: peippo <christoph.fink@gmail.com>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python2-tokenserver
_pkgname=tokenserver

pkgdesc="Mozilla Token Server"
url="https://github.com/mozilla-services/tokenserver"

pkgver=1.4.5
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
sha512sums=('353266b6a5499f3974576ec64d37e802d3badbdf2cc115ab75b19473da5262f9b086544d07d50a7920a4d175c3c6fd1b60cd5f02a90c3e58fe74fe5d4ea49496')

build(){
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
