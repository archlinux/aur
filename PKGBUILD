# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="xxhash"
_pkgname="xxHash"
_pkgver="0.6.3"
pkgver="v${_pkgver}"
pkgrel="1"
pkgdesc="Extremely fast non-cryptographic hash algorithm"
url="https://github.com/Cyan4973/xxHash"
license=('BSD')
arch=('i686' 'x86_64')
depends=('glibc')
changelog="ChangeLog"
source=("https://github.com/Cyan4973/xxHash/archive/${pkgver}.tar.gz")
sha1sums=('808926c5c4986759661e2258bf861fb3af1c8691')

build() {
    cd "${srcdir}/${_pkgname}-${_pkgver}/"

    make
}

package() {
    cd "${srcdir}/${_pkgname}-${_pkgver}/"

    install -D xxhsum "${pkgdir}/usr/bin/xxhsum"
    install -D xxh64sum "${pkgdir}/usr/bin/xxh64sum"
    install -D xxh32sum "${pkgdir}/usr/bin/xxh32sum"
}

# vim:set ts=4 sw=4 et:
