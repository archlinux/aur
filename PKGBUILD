# Maintainer: Taha YVR <https://github.com/tahayvr>
pkgname=omarchist-bin
pkgver=2.0.0
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
    'vulkan-driver'
    'libx11'
    'libxi'
    'openssl'
    'fontconfig'
    'alsa-lib'
)
provides=('omarchist')
conflicts=('omarchist' 'omarchist-git')

source_x86_64=("omarchist-linux-x86_64-${pkgver}.tar.gz::https://github.com/tahayvr/omarchist/releases/download/v${pkgver}/omarchist-linux-x86_64.tar.gz")
source_aarch64=("omarchist-linux-aarch64-${pkgver}.tar.gz::https://github.com/tahayvr/omarchist/releases/download/v${pkgver}/omarchist-linux-aarch64.tar.gz")

sha256sums_x86_64=('d0da1516e491dfe4c305225af886db1f0834195d6723e9e053d5f3a437d3f739')
sha256sums_aarch64=('74bf51b9d91fd7482a3329a0e69f7315b27d56edf08c7caced26593e9480f43c')

package() {
    install -Dm755 omarchist                    "${pkgdir}/usr/bin/omarchist"
    install -Dm644 omarchist.desktop            "${pkgdir}/usr/share/applications/omarchist.desktop"
    install -Dm644 omarchist.png                "${pkgdir}/usr/share/icons/hicolor/256x256/apps/omarchist.png"
    install -Dm644 README.md                    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE                      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
