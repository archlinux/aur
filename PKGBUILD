pkgname=arrpc-bun-bin
pkgver=1.4.0
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
sha256sums_x86_64=('dc1bd826420bdffec62b24df62ece489740176edb9976ed164ea855524d771b3')
sha256sums_aarch64=('26f9510736649680fbc159a8196f6713d98e31e6b420595cde6b3677229880fb')

package() {
    install -Dm755 "arrpc-bun-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/arrpc-bun"
    install -Dm644 arrpc-bun.service "${pkgdir}/usr/lib/systemd/user/arrpc-bun.service"
}
