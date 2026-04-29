# Maintainer: Daniel Baldwin <daniel@baldwin.io>
# Maintainer: Adam Haymond <coastgrd@gmail.com>
#
# NOTE: This file is the PKGBUILD template. The release workflow copies
# it and substitutes pkgver and checksums before publishing to AUR.

pkgname=vop-bin
pkgver=0.3.10
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

sha256sums_x86_64=('17a58da35638a7535cb2e570a203205f0e65058ad6e645084432852d5d834ef6')
sha256sums_aarch64=('0a81d42e5f5c9bc7eba3420eff36908484e9b21afdda349e9cc3d006ae59bbf6')

source+=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
sha256sums+=('6a393bdfa6c20c218bf73d378cf2e5b0fbf0e95c2a9644baf5714dd9d330dc64')

package() {
    install -Dm755 "${srcdir}/vop-linux-"* "${pkgdir}/usr/bin/vop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
