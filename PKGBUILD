# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=iso-commander-bin
pkgver=8.0.1
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
md5sums=('b22ae5f806dd5c241e95552d30419634'
         '7adb88ab3cccd741b2951fc27debf248')
package() {
    install -Dm755 "${srcdir}/isocmd" "${pkgdir}/usr/bin/isocmd"
    install -Dm644 "${srcdir}/isocmd.1" "${pkgdir}/usr/share/man/man1/isocmd.1"
}
