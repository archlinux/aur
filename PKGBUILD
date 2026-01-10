# Maintainer: Leonard Seibold <git@zrtx.de>
pkgname=zlaunch-bin
pkgver=0.3.0
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
sha256sums_x86_64=('9c3f543b763e7f98dd344c929959584e6e5528ae40a16ffad4c24f4a1ad5a910')
sha256sums_aarch64=('f6eaafcb551853611fc0b6581b8e402e9f33ea0eabcac3932a389983f62c21c6')

package() {
    cd "zlaunch-${pkgver}-${CARCH}-linux"
    install -Dm755 zlaunch "${pkgdir}/usr/bin/zlaunch"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
