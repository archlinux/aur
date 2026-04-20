# Maintainer: Taha YVR <taha@noiserandom.com>
pkgname=omarchist-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A GUI app for Omarchy Linux."
arch=('x86_64' 'aarch64')
url="https://github.com/tahayvr/omarchist"
license=('Apache-2.0')
install=omarchist.install
depends=(
    'libxcb'
    'libxkbcommon'
    'libxkbcommon-x11'
    'wayland'
    'vulkan-icd-loader'
    'libx11'
    'libxi'
    'mesa'
    'openssl'
    'fontconfig'
    'alsa-lib'
)
provides=('omarchist')
conflicts=('omarchist' 'omarchist-git')

source_x86_64=("omarchist-linux-x86_64-${pkgver}.tar.gz::https://github.com/tahayvr/omarchist/releases/download/v${pkgver}/omarchist-linux-x86_64.tar.gz")
source_aarch64=("omarchist-linux-aarch64-${pkgver}.tar.gz::https://github.com/tahayvr/omarchist/releases/download/v${pkgver}/omarchist-linux-aarch64.tar.gz")

sha256sums_x86_64=('116bca732e0988ba5ef7a77a53e6395d3b792fb7fb1f14c83c8e740e12be62f2')
sha256sums_aarch64=('0394f14bd5fb05ad871093217cd896d3f38d3c54783a77cfb240f951eedd5ad6')

package() {
    install -Dm755 omarchist                    "${pkgdir}/usr/bin/omarchist"
    install -Dm644 omarchist.desktop            "${pkgdir}/usr/share/applications/omarchist.desktop"
    install -Dm644 omarchist.png                "${pkgdir}/usr/share/icons/hicolor/256x256/apps/omarchist.png"
    install -Dm644 README.md                    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE                      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
