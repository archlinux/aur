# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=hx
pkgver=1.0.15
pkgrel=1
pkgdesc='Hex editor for the terminal using plain C99 + POSIX libs'
arch=('x86_64')
url='https://github.com/krpors/hx'
license=('MIT')
source=("https://github.com/krpors/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d4d1f4b65034cd16dd4119f064eae17fe56b39ba4813a958d493e5bfb0a91529')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX='/usr' install
}
