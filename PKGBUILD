# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=iso-commander-bin
pkgver=8.0.4
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
    "isocmd.conf.5::https://raw.githubusercontent.com/siyia2/iso-commander/refs/tags/v${pkgver}/man/isocmd.conf.5"
)
md5sums=('8d6888bf04e2126127ccc88b5f16fde7'
         '17ec9252b6b304ffb042abe999bc1e82'
         '050b17c6d08badcd3857c85939f95d51')
package() {
    install -Dm755 "${srcdir}/isocmd" "${pkgdir}/usr/bin/isocmd"
    install -Dm644 "${srcdir}/isocmd.1" "${pkgdir}/usr/share/man/man1/isocmd.1"
    install -Dm644 "${srcdir}/isocmd.conf.5" "${pkgdir}/usr/share/man/man5/isocmd.conf.5"
}
