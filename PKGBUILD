
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=telescope
pkgver=0.5
pkgrel=1
pkgdesc='w3m-like browser for Gemini.'
arch=('x86_64')
url='https://telescope.omarpolo.com'
license=('ISC')
provides=('telescope')
conflicts=('telescope-git' 'telescope-bin')
depends=('libretls')
source=("https://github.com/omar-polo/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('47662ed53c1b27724d4b59920ed901ff87dc123de7c1090eb372c34cd4b9efd9')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix='/usr'
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
