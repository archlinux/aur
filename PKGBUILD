# Maintainer: Dennis Stengele <d.stengele (at) derintendant (dot) de>
pkgname=tuptime
pkgver=3.3.3
pkgrel=1
pkgdesc="Report the historical and statistical running time of system"
arch=('any')
url="https://github.com/rfrail3/tuptime"
license=('GPL')
groups=()
depends=(
          'python'
        )
makedepends=()
optdepends=('cron')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/rfrail3/tuptime/archive/${pkgver}.tar.gz")
noextract=()
sha256sums=('be4dc5207859eeb0e6cfef206db5dd62b553e69ac0641c7203278cdd61c95bea')

package() {
    cd "$srcdir/$pkgname-${pkgver}"

    install -Dm755 "src/tuptime" "$pkgdir/usr/bin/tuptime"
    install -Dm644 "src/systemd/tuptime.service" "$pkgdir/usr/lib/systemd/system/tuptime.service"
    install -Dm644 "src/systemd/tuptime.timer" "$pkgdir/usr/lib/systemd/system/tuptime.timer"
}
