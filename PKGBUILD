# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=dvi2gr
pkgver=0.4
pkgrel=4
pkgdesc="Utility that generates grace formatting directives from latex"
arch=(i686 x86_64)
url="http://plasma-gate.weizmann.ac.il/Grace/"
depends=('t1lib')
license=('GPL')
source=(ftp://plasma-gate.weizmann.ac.il/pub/grace/src/devel/$pkgname-$pkgver.tar.gz tex2gr)

build() {
	cd "$srcdir"/$pkgname-$pkgver
	make
}

package() {
	cd "$srcdir"/$pkgname-$pkgver
	install -d "$pkgdir"/usr/bin
	install -Dm755 $pkgname "$pkgdir"/usr/bin/
	install -Dm755 "$srcdir"/tex2gr "$pkgdir"/usr/bin/
}

md5sums=('37a5fc6ff4f8634364ca15871714d3b0' 'c0cff2533f1c52ac06386d12e237ceb3')
