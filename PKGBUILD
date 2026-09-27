# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=iso-commander-bin
pkgver=7.5.2
pkgrel=3
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
md5sums=('73f04ffcd86293ccc2459b8ebcca5c45'
         '690a81568c9b26c7b6c8d88fe576dabc')
package() {
    install -Dm755 "${srcdir}/isocmd" "${pkgdir}/usr/bin/isocmd"
    install -Dm644 "${srcdir}/isocmd.1" "${pkgdir}/usr/share/man/man1/isocmd.1"
}
