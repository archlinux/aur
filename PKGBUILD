pkgname=iso-commander
pkgver=7.1.8
pkgrel=2
pkgdesc='The Fastest ISO Manager on the Planet, written in C++'
arch=('x86_64')
url="https://github.com/siyia2/iso-commander"
license=('GPL3')
depends=('coreutils' 'glibc' 'readline' 'util-linux' 'xz' 'zstd')
optdepends=(
    'ntfs-3g: NTFS formatting for Windows live USB creation (writes use the ntfs3 kernel driver)'
    'dosfstools: FAT32 formatting for Windows live USB creation'
    'parted: GPT partition layout for Windows live USB creation'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
    "isocmd::https://github.com/siyia2/iso-commander/releases/download/v${pkgver}/isocmd"
)
md5sums=(
    'b976079ab7970c1e08cb6159062a2192'
    '90c543acf24246b37a3dc7cac9e8c31d'
)

package() {
    install -Dm755 "${srcdir}/isocmd" "${pkgdir}/usr/bin/isocmd"

    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm644 "man/isocmd.1" "${pkgdir}/usr/share/man/man1/isocmd.1"
}
