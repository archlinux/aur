pkgname=arrpc-bun-bin
pkgver=1.3.4
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
sha256sums=('5b318f9251eb1aa45287e6437e543074933b3a8e6956d2c409fabc41fb9a7909')
sha256sums_x86_64=('b58ac410cd814ce0147819dd503a0a3c4ced6b13cbb6b7dcb8ef7a79184d7009')
sha256sums_aarch64=('10b9a1ae77c5ff59d224d66cffd0a8a70897f7e46098c6b79aab0fb0de7cf560')

package() {
    install -Dm755 "arrpc-bun-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/arrpc-bun"
    install -Dm644 arrpc-bun.service "${pkgdir}/usr/lib/systemd/user/arrpc-bun.service"
}
