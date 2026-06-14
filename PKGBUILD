# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=iso-commander
pkgver=7.3.6
pkgrel=2
pkgdesc='The Fastest ISO Manager on the Planet, written in C++'
arch=('x86_64')
url="https://github.com/siyia2/iso-commander"
license=('GPL-3.0-or-later')
depends=('readline' 'util-linux')
makedepends=('gcc' 'make')
conflicts=('iso-commander-bin')
optdepends=(
    'ntfsprogs: NTFS formatting for Windows live USB creation'
    'dosfstools: FAT32 formatting for Windows live USB creation'
    'parted: GPT partition layout for Windows live USB creation'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('5a893be1cc4cfc3be6a05646f5dac906')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 isocmd "${pkgdir}/usr/bin/isocmd"
    install -Dm644 "man/isocmd.1" "${pkgdir}/usr/share/man/man1/isocmd.1"
}
