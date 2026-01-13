# Maintainer: Leonard Seibold <git@zrtx.de>
pkgname=zlaunch-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='A fast application launcher for Linux wayland desktops built with GPUI'
arch=('x86_64' 'aarch64')
url='https://github.com/zortax/zlaunch'
license=('MIT')
depends=(
    'wayland'
    'freetype2'
    'fontconfig'
    'openssl'
    'libxkbcommon'
    'libxkbcommon-x11'
    'libxcb'
    'vulkan-icd-loader'
)
provides=('zlaunch')
conflicts=('zlaunch' 'zlaunch-git')
source_x86_64=("${url}/releases/download/${pkgver}/zlaunch-${pkgver}-x86_64-linux.tar.gz")
source_aarch64=("${url}/releases/download/${pkgver}/zlaunch-${pkgver}-aarch64-linux.tar.gz")
sha256sums_x86_64=('98689f9561186e4fc59e0bccb7a2c2213e4db2e7c26ba84c980c0c3e6047f97e')
sha256sums_aarch64=('1a1e4faf724cf4a72ac3a2be8bd2b50c3d9b5a59866843a20025b89b98695405')

package() {
    cd "zlaunch-${pkgver}-${CARCH}-linux"
    install -Dm755 zlaunch "${pkgdir}/usr/bin/zlaunch"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
