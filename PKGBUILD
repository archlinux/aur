
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=telescope
pkgver=0.8.1
pkgrel=1
pkgdesc='w3m-like browser for Gemini.'
arch=('x86_64')
url='https://telescope.omarpolo.com'
license=('ISC')
provides=('telescope')
conflicts=('telescope-git' 'telescope-bin')
depends=('libretls')
source=("https://github.com/omar-polo/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('ea860a8868fcba303d6db2ad3340a3e2584048b2c5001624ab12b626eba874b9')

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
