# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=soar-bin
_pkgname=Soar
pkgver=0.5.5
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
sha256sums_aarch64=('7c10c327b16abc289594010605d8ea416ff0df642b62d1fecef8b192a4ec1d5d')
sha256sums_x86_64=('4fcf1f711640ed0ea2d783aa94761cff21a062e502f186b9c3faa88d83479e4d')
package() {
    install -Dm755 "${srcdir}/release/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/release/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/release/"*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
