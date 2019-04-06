# Maintainer: Yann Orieult <yo.managements@gmail.com>

pkgname=timer
pkgver=5.9699978
pkgrel=1
pkgdesc='a simple timer/minutor for terminal with audio alarm'
arch=('any')
url='https://github.com/yoarch/timer'
license=('MIT')
depends=('bash' 'mpv')
makedepends=('')

source=("git://github.com/yoarch/timer.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
	mkdir -p "$pkgdir/usr/share/sounds/$pkgname"
	install -Dm644 audio/duck.wav "$pkgdir/usr/share/sounds/$pkgname/"
}
