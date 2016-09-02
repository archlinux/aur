# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="xxhash"
_pkgname="xxHash"
_pkgver="0.6.2"
pkgver="v${_pkgver}"
pkgrel="1"
pkgdesc="Extremely fast non-cryptographic hash algorithm"
url="https://github.com/Cyan4973/xxHash"
license=('BSD')
arch=('i686' 'x86_64')
depends=('lib32-glibc' 'glibc')
changelog="ChangeLog"
source=("https://github.com/Cyan4973/xxHash/archive/${pkgver}.tar.gz")
sha1sums=('303f93e57b4e1ddc627d62a3313eaab82fd11720')

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
