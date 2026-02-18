# Maintainer: Daniel Baldwin <daniel@baldwin.io>
pkgname=vop-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="AWS credential management via 1Password"
arch=('x86_64' 'aarch64')
url="https://github.com/NodeSpy/vop"
license=('MIT')
depends=('1password-cli')
provides=('vop')
conflicts=('vop')

source_x86_64=("${url}/releases/download/v${pkgver}/vop-linux-amd64")
source_aarch64=("${url}/releases/download/v${pkgver}/vop-linux-arm64")

sha256sums_x86_64=('d3c0bd9972833ab54a6f75c29b28377a4301e92cf2c47f3c49e260d630246e17')
sha256sums_aarch64=('567d57642f9a1dbde16c16c3da5e1a2455207c4014e233cbc008f1dcc970810a')

source+=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
sha256sums+=('6a393bdfa6c20c218bf73d378cf2e5b0fbf0e95c2a9644baf5714dd9d330dc64')

package() {
    install -Dm755 "${srcdir}/vop-linux-"* "${pkgdir}/usr/bin/vop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
