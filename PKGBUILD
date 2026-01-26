# Maintainer: qaidvoid
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=soar-bin
pkgver=0.10.3
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
sha256sums_aarch64=('ea475c1015319f3d3880ae89dc202ee34be3ac2e66f4f7fa6f555156cf8a030a')
sha256sums_x86_64=('1114408cb3997d5388f2fbad5ba6a693669a7aff06be5a579989f04c07aec3bd')
package() {
    install -Dm755 "${srcdir}/release/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/release/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/release/"*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
