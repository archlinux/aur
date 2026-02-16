# Maintainer: Leonard Seibold <git@zrtx.de>
pkgname=zlaunch-bin
pkgver=0.5.0
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
sha256sums_x86_64=('fff443e7bee5b6d7d1f8c63be4e2d3144b6500e3ab00d3dfa89a34f02cec94e2')
sha256sums_aarch64=('d021bf41667b064290c308fb6c426ca8f7345afcee9bf98b4815ff14f97ca2fd')

package() {
    cd "zlaunch-${pkgver}-${CARCH}-linux"
    install -Dm755 zlaunch "${pkgdir}/usr/bin/zlaunch"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
