# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=iso-commander
pkgver=8.0.41
pkgrel=1
pkgdesc='The Fastest ISO Manager on the Planet, written in C++'
arch=('x86_64')
url="https://github.com/siyia2/iso-commander"
license=('GPL-3.0-or-later')
depends=('util-linux')
makedepends=('gcc>=15' 'make>=4.3')
conflicts=('iso-commander-bin')
optdepends=(
    'ntfsprogs: NTFS formatting for Windows live USB creation'
    'dosfstools: FAT32 formatting for Windows live USB creation'
    'parted: GPT partition layout for Windows live USB creation'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('b8a99702256827a6037927efe7a81de8')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make CXX=g++
}
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 isocmd "${pkgdir}/usr/bin/isocmd"
    install -Dm644 "man/isocmd.1" "${pkgdir}/usr/share/man/man1/isocmd.1"
    install -Dm644 "man/isocmd.conf.5" "${pkgdir}/usr/share/man/man5/isocmd.conf.5"
}
