# Maintainer: Dennis Stengele <d.stengele (at) derintendant (dot) de>
pkgname=tuptime
pkgver=3.3.0
pkgrel=2
pkgdesc="Report the historical and statistical running time of system"
arch=('any')
url="https://github.com/rfrail3/tuptime"
license=('GPL')
groups=()
depends=(
          'python2'
          'cron'
        )
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/rfrail3/tuptime/archive/${pkgver}-${pkgrel}.tar.gz")
noextract=()
sha256sums=('0c48cea06eba819c9c0d9818c59390d16feb8dc3e8d19d2c34e9b157f1fa02ae')

package() {
    cd "$srcdir/$pkgname-${pkgver}-${pkgrel}"

    install -Dm755 "src/tuptime" "$pkgdir/usr/bin/tuptime"
    install -Dm644 "src/systemd/tuptime.service" "$pkgdir/usr/lib/systemd/system/tuptime.service"
    install -Dm644 "src/cron.d/tuptime" "$pkgdir/etc/cron.d/tuptime"
}
