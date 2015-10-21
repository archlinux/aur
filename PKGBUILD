# Maintainer: Dennis Stengele <d.stengele (at) derintendant (dot) de>
pkgname=tuptime
pkgver=3.0.00
pkgrel=1
pkgdesc="Report the historical and statistical running time of system"
arch=('any')
url="https://github.com/rfrail3/tuptime"
license=('GPL')
groups=()
depends=(	'python2'
			'cron')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("	$pkgname-$pkgver.tar.gz::https://github.com/rfrail3/tuptime/archive/v$pkgver.tar.gz")
noextract=()
sha256sums=('8c3a2bc21e1fa1d30cd6f0e61aaeb6fa20461bfda2e13bfc77f67d302af70a08')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	
	install -Dm755 "latest/tuptime" "$pkgdir/usr/bin/tuptime"
	install -Dm644 "latest/systemd/tuptime.service" "$pkgdir/usr/lib/systemd/system/tuptime.service"
	install -Dm644 "latest/cron.d/tuptime" "$pkgdir/etc/cron.d/tuptime"
}
