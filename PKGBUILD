pkgname=arrpc-bun-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="TypeScript/Bun port of arRPC - Open Discord RPC server (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/Creationsss/arrpc-bun"
license=('MIT')
depends=()
provides=('arrpc-bun')
conflicts=('arrpc-bun')
source=("arrpc-bun.service")
source_x86_64=("arrpc-bun-${pkgver}-x86_64::https://github.com/Creationsss/arrpc-bun/releases/download/v${pkgver}/arrpc-bun-linux-x64")
source_aarch64=("arrpc-bun-${pkgver}-aarch64::https://github.com/Creationsss/arrpc-bun/releases/download/v${pkgver}/arrpc-bun-linux-arm64")
sha256sums=('f1e20a82f8cb2fa8d5f007511ca78eed8eda44dbe1cef596afb2ec3bf03c66e9')
sha256sums_x86_64=('c79fcaf3647dde06e42901db53683e4e61649dde51cd39acc9ab3aa579ffc04c')
sha256sums_aarch64=('5d87e98e37f0929804e5898c4fbb440f82dd63a4a28d50b44c0e9c0b1ccab411')

package() {
    install -Dm755 "arrpc-bun-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/arrpc-bun"
    install -Dm644 arrpc-bun.service "${pkgdir}/usr/lib/systemd/user/arrpc-bun.service"
}
