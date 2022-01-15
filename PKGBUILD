
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=telescope
pkgver=0.7.1
pkgrel=1
pkgdesc='w3m-like browser for Gemini.'
arch=('x86_64')
url='https://telescope.omarpolo.com'
license=('ISC')
provides=('telescope')
conflicts=('telescope-git' 'telescope-bin')
depends=('libretls')
source=("https://github.com/omar-polo/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('6549392d4d5cfbff23f2b2cfb2bd679c9c0b681514561034d492d0941ac5b114')

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
