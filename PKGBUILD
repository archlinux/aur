# Maintainer: Leonard Seibold <git@zrtx.de>
pkgname=zlaunch-bin
pkgver=0.5.1
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
sha256sums_x86_64=('936b582702b802e7ee7c7ef9261b2c7b57e1b0cc485d872bba98e4ad059487e6')
sha256sums_aarch64=('dc0a1c95ad396521c651b39694b7d2ead1c8738677d9aa881e3691fbe95376f4')

package() {
    cd "zlaunch-${pkgver}-${CARCH}-linux"
    install -Dm755 zlaunch "${pkgdir}/usr/bin/zlaunch"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
