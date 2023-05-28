# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>

pkgname=vimcat
pkgver=1.1.1
pkgdesc='A `cat` that uses vim'\''s syntax highlighting'
pkgrel=1
arch=(any)
license=(BSD)
depends=(vim bash)
makedepends=(make rgb.txt)
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/ctrlcctrlv/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
	"$pkgname-$pkgver-$pkgrel.tar.gz.sig::https://github.com/ctrlcctrlv/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-1.tar.gz.sig")
sha256sums=('bf194d0b8293e941fe331de2033612321aa5ffb2bae34072f352d9bb8c868441'
            'SKIP')
validpgpkeys=(98F28F767470129FBE3B054CE2154DD1A1C77B8B)

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
