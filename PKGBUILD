# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=iso-commander
pkgver=7.2.0
pkgrel=3
pkgdesc='The Fastest ISO Manager on the Planet, written in C++'
arch=('x86_64')
url="https://github.com/siyia2/iso-commander"
license=('GPL3')
depends=('coreutils' 'glibc' 'readline' 'util-linux' 'xz' 'zstd')
makedepends=('gcc' 'make')
conflicts=('iso-commander-bin')
optdepends=(
    'ntfsprogs: NTFS formatting for Windows live USB creation'
    'dosfstools: FAT32 formatting for Windows live USB creation'
    'parted: GPT partition layout for Windows live USB creation'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('e9f95ff88668ee0ee01c8d75cde41c80')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 isocmd "${pkgdir}/usr/bin/isocmd"
    install -Dm644 "man/isocmd.1" "${pkgdir}/usr/share/man/man1/isocmd.1"
}
