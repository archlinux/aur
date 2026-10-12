# Maintainer: Stefanie Jane <stef@hyperbliss.tech>
pkgname=unifly-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="CLI + TUI for managing UniFi network controllers"
arch=('x86_64' 'aarch64')
url="https://github.com/hyperb1iss/unifly"
license=('Apache-2.0')
provides=('unifly')
conflicts=('unifly')
depends=('gcc-libs' 'openssl' 'dbus')
install=unifly-bin.install

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/hyperb1iss/unifly/releases/download/v${pkgver}/unifly-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/hyperb1iss/unifly/releases/download/v${pkgver}/unifly-linux-arm64")

sha256sums_x86_64=('df67dc26ef16dd96a6c474d8e7da4e2c4dc7ddc9352e4884641ee70344f21bca')
sha256sums_aarch64=('8beedf0f338e9aa34ec40a375093f8568da4e863559c66ce4da593bfb34cdb05')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/unifly"
}
