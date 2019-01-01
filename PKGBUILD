# Maintainer: Dennis Stengele <d.stengele (at) derintendant (dot) de>
pkgname=tuptime
pkgver=3.4.2
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
sha256sums=('784bfcd3026128cf7addaaf821f2f5a9c1d1626f5dd83b3b138090f6fb346e9e')

package() {
    cd "$srcdir/$pkgname-${pkgver}"

    install -Dm755 "src/tuptime" "$pkgdir/usr/bin/tuptime"
    install -Dm644 "src/systemd/tuptime-cron.service" "$pkgdir/usr/lib/systemd/system/tuptime-cron.service"
    install -Dm644 "src/systemd/tuptime-cron.timer" "$pkgdir/usr/lib/systemd/system/tuptime-cron.timer"
}
