pkgname=arrpc-bun-bin
pkgver=1.3.2
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
sha256sums_x86_64=('bc6917492a3b0e4dc8265ca14fc7860dce8796da59fc4a637c043188d7da1381')
sha256sums_aarch64=('f21f2feb864af29ce05c8f89ae41dea89cc7ece87108693d7091e0e9acd0eb10')

package() {
    install -Dm755 "arrpc-bun-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/arrpc-bun"
    install -Dm644 arrpc-bun.service "${pkgdir}/usr/lib/systemd/user/arrpc-bun.service"
}
