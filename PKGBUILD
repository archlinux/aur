# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="xxhash"
_pkgname="xxHash"
pkgver="r42"
pkgrel="1"
pkgdesc="Extremely fast non-cryptographic hash algorithm"
url="https://github.com/Cyan4973/xxHash"
license=('BSD')
arch=('i686' 'x86_64')
depends=('lib32-glibc' 'glibc')
changelog="ChangeLog"
source=("https://github.com/Cyan4973/xxHash/archive/${pkgver}.tar.gz")
sha1sums=('196ecb63d818bda9fc5e3041bd517267fd58a7e3')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"

    make all
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"

    install -D xxhsum "${pkgdir}/usr/bin/xxhsum"
    install -D xxh64sum "${pkgdir}/usr/bin/xxh64sum"
    install -D xxh32sum "${pkgdir}/usr/bin/xxh32sum"
}

# vim:set ts=4 sw=4 et:
