# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=iso-commander-bin
pkgver=7.1.8
pkgrel=2
pkgdesc='The Fastest ISO Manager on the Planet, written in C++'
arch=('x86_64')
url="https://github.com/siyia2/iso-commander"
license=('GPL3')
depends=('coreutils' 'glibc' 'readline' 'util-linux' 'xz' 'zstd')
optdepends=(
    'ntfs-3g: NTFS formatting for Windows live USB creation (writes use the native kernel driver)'
    'dosfstools: FAT32 formatting for Windows live USB creation'
    'parted: GPT partition layout for Windows live USB creation'
)
source=(
    "isocmd::https://github.com/siyia2/iso-commander/releases/download/v${pkgver}/isocmd"
    "isocmd.1::https://raw.githubusercontent.com/siyia2/iso-commander/refs/heads/main/man/isocmd.1"
)
md5sums=('90c543acf24246b37a3dc7cac9e8c31d'
         'a4d0bcbbe64f996ecaa19d3bbd890bbd')

package() {
    install -Dm755 "${srcdir}/isocmd" "${pkgdir}/usr/bin/isocmd"
    install -Dm644 "${srcdir}/isocmd.1" "${pkgdir}/usr/share/man/man1/isocmd.1"
}
