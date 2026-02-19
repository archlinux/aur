# Maintainer: Daniel Baldwin <daniel@baldwin.io>
# Maintainer: Adam Haymond <coastgrd@gmail.com>
#
# NOTE: This file is the PKGBUILD template. The release workflow copies
# it and substitutes pkgver and checksums before publishing to AUR.

pkgname=vop-bin
pkgver=0.3.6
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

sha256sums_x86_64=('317225281515d1cf420fe92374bc137cf4964935b1c687377513f69472971149')
sha256sums_aarch64=('16cbcc15ba9c397e882ef620a8a4757dba03b86979b529b8890d23bb1026ab6c')

source+=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
sha256sums+=('6a393bdfa6c20c218bf73d378cf2e5b0fbf0e95c2a9644baf5714dd9d330dc64')

package() {
    install -Dm755 "${srcdir}/vop-linux-"* "${pkgdir}/usr/bin/vop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
