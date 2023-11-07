# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=hx
pkgver=1.0.14
pkgrel=1
pkgdesc='Hex editor for the terminal using plain C99 + POSIX libs'
arch=('x86_64')
url='https://github.com/krpors/hx'
license=('MIT')
source=("https://github.com/krpors/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7b7c494df149535f768b3aa449159928aec92b468a17f9eedebcea3dd21343d1')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX='/usr' install
}
