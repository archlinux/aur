# Maintainer: Yann Orieult <yo.managements@gmail.com>

pkgname=timer
pkgver=2.0.0.r2.g46992c8
pkgrel=1
epoch=0
pkgdesc='Simple CLI timer'
arch=('any')
url='https://github.com/yoarch/timer'
license=('MIT')
depends=('bash' 'mpv')

source=("git+https://github.com/yoarch/timer.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$pkgname"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/lib/$pkgname/README.md"
	install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
	mkdir -p "$pkgdir/usr/share/sounds/$pkgname"
	install -Dm644 audio/duck.wav "$pkgdir/usr/share/sounds/$pkgname/"
}
