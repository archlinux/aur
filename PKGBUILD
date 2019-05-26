# Maintainer: dax <dev@dax.moe>
pkgname=xdcc
pkgver=0.1.1
pkgrel=1
pkgdesc="xdcc file downloader"
arch=('x86_64')
url="https://git.sr.ht/~dax/xdcc"
license=('ISC')
makedepends=('go' 'scdoc')
source=("https://git.sr.ht/~dax/$pkgname/archive/$pkgver.tar.gz")
md5sums=('17da303dd6a17c2339cfbc5b0185efc2')

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
