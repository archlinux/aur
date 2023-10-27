# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=hx
pkgver=1.0.13
pkgrel=1
pkgdesc='Hex editor for the terminal using plain C99 + POSIX libs'
arch=('x86_64')
url='https://github.com/krpors/hx'
license=('MIT')
source=("https://github.com/krpors/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('539e17fc82b86696031fb0649c22f61b0da15d780c52d360959d96669940e8f5')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX='/usr' install
}
