# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=iso-commander-bin
pkgver=7.4.5
pkgrel=4
pkgdesc='The Fastest ISO Manager on the Planet, written in C++'
arch=('x86_64')
url="https://github.com/siyia2/iso-commander"
license=('GPL-3.0-or-later')
provides=('iso-commander')
conflicts=('iso-commander')
optdepends=(
    'ntfsprogs: NTFS formatting for Windows live USB creation'
    'dosfstools: FAT32 formatting for Windows live USB creation'
    'parted: GPT partition layout for Windows live USB creation'
)
source=(
    "isocmd::https://github.com/siyia2/iso-commander/releases/download/v${pkgver}/isocmd"
    "isocmd.1::https://raw.githubusercontent.com/siyia2/iso-commander/refs/tags/v${pkgver}/man/isocmd.1"
)
md5sums=('30856c0a50a8b29cb1a9dfa8cf73cfdd'
         'f66543edad91ed2588678d7f87365ea6')
package() {
    install -Dm755 "${srcdir}/isocmd" "${pkgdir}/usr/bin/isocmd"
    install -Dm644 "${srcdir}/isocmd.1" "${pkgdir}/usr/share/man/man1/isocmd.1"
}
