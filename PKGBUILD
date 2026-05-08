# Maintainer: Pavle Barši <pakibarsipavle@gmail.com>

pkgname=mnd
pkgver=1.1
pkgrel=1
pkgdesc="A tool that can deauth multiple networks at once written in C++"
arch=('x86_64')
url="https://github.com/MidnightPavlaka635920/multiple-network-deauth"
license=('GPLv3')
depends=('aircrack-ng' 'wireless_tools')
makedepends=('make' 'gcc')

source=("git+https://github.com/MidnightPavlaka635920/multiple-network-deauth.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/multiple-network-deauth"
    make -j$(nproc)
}

package() {
    cd "${srcdir}/multiple-network-deauth"
    install -Dm755 mnd "${pkgdir}/usr/bin/mnd"

    install -Dm644 README.md \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
