# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=iso-commander-bin
pkgver=7.2.8
pkgrel=1
pkgdesc='The Fastest ISO Manager on the Planet, written in C++'
arch=('x86_64')
url="https://github.com/siyia2/iso-commander"
license=('GPL-3.0-or-later')
provides=('iso-commander')
conflicts=('iso-commander')
optdepends=(
    'util-linux: Mount/umount for handling Windows ISO'
    'ntfsprogs: NTFS formatting for Windows live USB creation'
    'dosfstools: FAT32 formatting for Windows live USB creation'
    'parted: GPT partition layout for Windows live USB creation'
)
source=(
    "isocmd::https://github.com/siyia2/iso-commander/releases/download/v${pkgver}/isocmd"
    "isocmd.1::https://raw.githubusercontent.com/siyia2/iso-commander/refs/tags/v${pkgver}/man/isocmd.1"
)
md5sums=('6ec39f241fd4af1ce2d778fa254fe60e'
         'f1b9179046fb7d1b2271b5b39e072e08')
package() {
    install -Dm755 "${srcdir}/isocmd" "${pkgdir}/usr/bin/isocmd"
    install -Dm644 "${srcdir}/isocmd.1" "${pkgdir}/usr/share/man/man1/isocmd.1"
}
