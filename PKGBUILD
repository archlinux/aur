# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="xxhash"
_pkgname="xxHash"
_pkgver="0.5.0"
pkgver="v${_pkgver}"
pkgrel="1"
pkgdesc="Extremely fast non-cryptographic hash algorithm"
url="https://github.com/Cyan4973/xxHash"
license=('BSD')
arch=('i686' 'x86_64')
depends=('lib32-glibc' 'glibc')
changelog="ChangeLog"
source=("https://github.com/Cyan4973/xxHash/archive/${pkgver}.tar.gz")
sha1sums=('ccd51c862a6cab4bd772a0a8e99a0fd36d19229a')

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
