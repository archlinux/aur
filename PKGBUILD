# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=soar-bin
_pkgname=Soar
pkgver=0.4.4
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-aarch64-linux.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-x86_64-linux.tar.gz")
sha256sums_aarch64=('fe94c670927befbd83054159db3b399f614a67cf68e45f25e1461a224904fdd9')
sha256sums_x86_64=('a79d103a222d4da480db33480d16dc6c5990e250c5b93dc4c9906af86458bf2e')
package() {
    install -Dm755 "${srcdir}/release/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/release/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
