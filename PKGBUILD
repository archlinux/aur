# Maintainer: Dmitry Mozzherin <dmozzherin@gmail.com>

pkgname=muro
pkgver=0.2.4
pkgrel=1
pkgdesc='Wallpaper with blurred or averaged background for any background tool'
arch=('x86_64' 'aarch')
url="https://codeberg.org/dimus/$pkgname"
license=('MIT')
makedepends=(
	'go'
	'just'
)
depends=(
)
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://codeberg.org/dimus/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('43c9008946c7c6f17243a632156a051b8ce9b37980a1388a81d533e38aab1b1c')

prepare() {
	cd "$pkgname"
	mkdir -p build/
}

build() {
	cd "$pkgname"
	just build
}

check() {
	cd "$pkgname"
	just test
}

package() {
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm755 "$srcdir/$pkgname/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
