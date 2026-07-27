# Maintainer: Daniel Baldwin <daniel@baldwin.io>
# Maintainer: Adam Haymond <coastgrd@gmail.com>
#
# NOTE: This file is the PKGBUILD template. The release workflow copies
# it and substitutes pkgver and checksums before publishing to AUR.

pkgname=vop-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="AWS credential management via 1Password"
arch=('x86_64' 'aarch64')
url="https://github.com/NodeSpy/vop"
license=('MIT')
depends=('1password-cli')
provides=('vop')
conflicts=('vop')

source_x86_64=("vop-linux-amd64-${pkgver}::${url}/releases/download/v${pkgver}/vop-linux-amd64")
source_aarch64=("vop-linux-arm64-${pkgver}::${url}/releases/download/v${pkgver}/vop-linux-arm64")

sha256sums_x86_64=('5dca0cee0a305ef1f57ccf57d1734f40298b139c187f6a1799b5db5f8323ed6c')
sha256sums_aarch64=('332d947695f631dd6332b18c0059b77a69cffc619b62b574366bba1c40ec7607')

source+=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
sha256sums+=('6a393bdfa6c20c218bf73d378cf2e5b0fbf0e95c2a9644baf5714dd9d330dc64')

package() {
    install -Dm755 "${srcdir}/vop-linux-"* "${pkgdir}/usr/bin/vop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
