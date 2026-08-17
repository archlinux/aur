# Maintainer: Daniel Baldwin <daniel@baldwin.io>
# Maintainer: Adam Haymond <coastgrd@gmail.com>
#
# NOTE: This file is the PKGBUILD template. The release workflow copies
# it and substitutes pkgver and checksums before publishing to AUR.

pkgname=vop-bin
pkgver=0.8.1
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

sha256sums_x86_64=('732bf940a0f3a02a53d4b588644731898778ff3fc01997bf855521c2379ae39b')
sha256sums_aarch64=('6d50b795181dbd959e6c40de0ad476c8459b7da9fb8b13e1332d941183491e5d')

source+=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
sha256sums+=('6a393bdfa6c20c218bf73d378cf2e5b0fbf0e95c2a9644baf5714dd9d330dc64')

package() {
    install -Dm755 "${srcdir}/vop-linux-"* "${pkgdir}/usr/bin/vop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
