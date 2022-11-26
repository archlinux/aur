# Maintainer: Yann Orieult <yo.managements@gmail.com>

pkgname=regal
pkgver=13.85a6d42
pkgrel=1
pkgdesc='Simple CLI regular alarm'
arch=('any')
url='https://github.com/yoarch/regal'
license=('MIT')
depends=('bash' 'mpv')
#makedepends=('')

source=("git+https://github.com/yoarch/regal.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
} # '

package() {
	cd "$srcdir/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE    "
	install -Dm644 README.md "$pkgdir/usr/lib/$pkgname/README.md"
	install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
	mkdir -p "$pkgdir/usr/share/sounds/$pkgname"
	install -Dm644 audio/duck.wav "$pkgdir/usr/share/sounds/$pkgname/"
}
