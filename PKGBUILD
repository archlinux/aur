# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aioncore-bin
_pkgname=AionCore
pkgver=0.2.2
pkgrel=1
pkgdesc="The backend server for AionUi, built with Rust (Axum + Tokio + SQLite). It provides HTTP REST APIs and WebSocket real-time events for the AionUi desktop client."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/iOfficeAI/AionCore"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=(
    'glibc'
    'zlib-ng-compat'
    'xz'
    'libgcc'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('e9bbb4a6f909cd14aa8b3d78a5c139557c2063930d155f6102df424d27155292')
sha256sums_x86_64=('1c3f241c7deff8e9d6da189c1017e6b12df7b538a1f557276c79b3c33d257335')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
}
