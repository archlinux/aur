# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=haredo
pkgver=1.0.5
pkgrel=1
license=("custom:WTFPL")
pkgdesc="A simple and unix-idiomatic build automator."
makedepends=(
	"hare"
)

arch=("x86_64" "aarch64")
url="https://git.sr.ht/~autumnull/haredo"
source=("https://git.sr.ht/~autumnull/haredo/archive/$pkgver.tar.gz")

provides=("haredo")
conflicts=("haredo")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./bootstrap.sh
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	./bin/haredo test
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	PREFIX="$pkgdir/usr" ./bootstrap.sh install
}

sha256sums=('b3f7e7d6f0fd6b275b3ca1c80e37eac93c51351707ec9d29ae36399380008086')
