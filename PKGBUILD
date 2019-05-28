# Maintainer: dax <dev@dax.moe>
pkgname=xdcc
pkgver=0.1.1
pkgrel=2
pkgdesc="xdcc file downloader"
arch=('x86_64')
url="https://git.sr.ht/~dax/xdcc"
license=('ISC')
makedepends=('go' 'scdoc')
source=("https://git.sr.ht/~dax/$pkgname/archive/$pkgver.tar.gz")
md5sums=('4e4b203d26ef6b4b7c7143d19db19e65')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -D -m 0644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
	install -D -m 0644 README.md "$pkgdir"/usr/share/doc/"$pkgname"/README.md
}
