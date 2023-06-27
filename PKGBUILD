# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>

pkgname=stevenblack
pkgver=0.9
pkgrel=1
pkgdesc='Download the latest hosts file from StevenBlack'
arch=('any')
license=('MIT')
depends=('systemd' 'curl' 'bash')
url="https://github.com/StevenBlack/hosts"
source=("$pkgname" "$pkgname.service" "$pkgname.timer")
sha256sums=('4b29fc48ae6185c137e393168179881a0412e0adf0ecba9e33f248d3d5a9c837'
            '62d745b328407b1d9fec06b252c345ec6c99a3ad2e8fc480bc16bf894262ec6e'
            'c0cb26fd4255485dbf3df7deff6a385931d3f9fb48f429eac70e534902a4bcb4')

package() {
	cd -- "$srcdir"
	install -Dm755 "$pkgname"		"$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$pkgname.service"	"$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 "$pkgname.timer"		"$pkgdir/usr/lib/systemd/system/$pkgname.timer"
}
