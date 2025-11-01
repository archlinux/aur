pkgname=arrpc-bun-bin
pkgver=1.2.9
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
sha256sums_x86_64=('12bd168df2a594370c2672de2365714de8daf205e50d28dd5fd1267776dafed3')
sha256sums_aarch64=('164aacb6f5c6af949d0bbba415b97305c7b0a4b8de1562c31b75cd9f3bcb6d44')

package() {
    install -Dm755 "arrpc-bun-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/arrpc-bun"
    install -Dm644 arrpc-bun.service "${pkgdir}/usr/lib/systemd/user/arrpc-bun.service"
}
