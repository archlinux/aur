# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=haredo
pkgver=1.0.3
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
	make LDLINKFLAGS=${LDFLAGS#"-Wl,"}
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	make PREFIX="$pkgdir/usr" install
}

sha256sums=('025d8f787a1b872972fcad08bad9aa7ada5e2ae7f193d4bb0264d331f4f26ff3')
