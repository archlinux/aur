# Maintainer: Yann Orieult <yo.managements@gmail.com>

pkgname=regal
pkgver=4.aff138c
pkgrel=1
pkgdesc='a simple regular alarm for terminal'
arch=('any')
url='https://github.com/yoarch/regal'
license=('MIT')
depends=('bash' 'mpv')
makedepends=('')

source=("git://github.com/yoarch/regal.git")
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
