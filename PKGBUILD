# Maintainer: Yann Orieult <yo.managements@gmail.com>

pkgname=timer
pkgver=8.378985f
pkgrel=1
pkgdesc='a simple timer for terminal with audio alarm'
arch=('any')
url='https://github.com/yoarch/timer'
license=('MIT')
depends=('bash' 'mpv')
#makedepends=('')

source=("git://github.com/yoarch/timer.git")
#source#=("file:///$MHOME/dev/aur/timer/timer.tar.gz")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
} # '

package() {
	cd "$srcdir/$pkgname"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/lib/$pkgname/README.md"
	install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
	mkdir -p "$pkgdir/usr/share/sounds/$pkgname"
	install -Dm644 audio/duck.wav "$pkgdir/usr/share/sounds/$pkgname/"
}
