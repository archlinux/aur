pkgname=arrpc-bun-bin
pkgver=1.3.6
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
sha256sums_x86_64=('438b021c9251c47843c16d4bc11862cd0c79241d693353a217eb48f0711aa915')
sha256sums_aarch64=('03759ef3ae1052a6c56288b8219dc23751da65d3bd89fea34c4fc5739023a80a')

package() {
    install -Dm755 "arrpc-bun-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/arrpc-bun"
    install -Dm644 arrpc-bun.service "${pkgdir}/usr/lib/systemd/user/arrpc-bun.service"
}
