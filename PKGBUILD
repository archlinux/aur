# Maintainer: Dennis Stengele <d.stengele (at) derintendant (dot) de>
pkgname=tuptime
pkgver=2.1.00
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
source=("	$pkgname-$pkgver.tar.gz::https://github.com/rfrail3/tuptime/archive/v$pkgver.tar.gz"
			"tuptime.service"
			"tuptime.cron")
noextract=()
sha256sums=('67b53feb2b7d4751045e6dff1b6fb7d3d3c8725b821c4b5eeb7b6b849f70c22c'
            'f7e106eb400fb3aa7ea5d0f8f5388d53cf38b054a9dae7e77268489c21e3a2f2'
            '54675450a0c0f8d300a380b8ab61ca7845da7da0f7985694d086eda1eb77b81a')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	
	install -Dm755 "latest/tuptime" "$pkgdir/usr/bin/tuptime"
	install -Dm644 "$srcdir/tuptime.service" "$pkgdir/usr/lib/systemd/system/tuptime.service"
	install -Dm644 "$srcdir/tuptime.cron" "$pkgdir/etc/cron.d/tuptime"
}
