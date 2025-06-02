# Maintainer: qaidvoid
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=soar-bin
pkgver=0.6.1
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
sha256sums_aarch64=('1ab3c690383c9cf40a6b57a17b8921345d5bb598d860d8a1bf07aea43a1aaf18')
sha256sums_x86_64=('a138f7798445cfc79ce9c89673cebf9d78459d71221fa91e24976d401a8a2b62')
package() {
    install -Dm755 "${srcdir}/release/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/release/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/release/"*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
