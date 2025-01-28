# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=soar-bin
_pkgname=Soar
pkgver=0.5.1
pkgrel=1
pkgdesc="A fast, modern package manager for Static Binaries, Portable Formats (AppImage|AppBundle|FlatImage|Runimage) & More.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://soar.qaidvoid.dev/"
_ghurl="https://github.com/pkgforge/soar"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
options=(
    '!strip'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-aarch64-linux.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-x86_64-linux.tar.gz")
sha256sums_aarch64=('037c8619fa0de45a120be1a4fb1c5a53fb9cb85ee9517c904a78a823bfbcf129')
sha256sums_x86_64=('5912ea80df717d5906e1cb4a868d56365612b2f441e68593c51d85d027108950')
package() {
    install -Dm755 "${srcdir}/release/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/release/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
