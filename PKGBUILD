# Maintainer: Emati Mitame <aur@mita.me>
pkgname=kmd
pkgver=0.9.19
pkgrel=1
pkgdesc="Komodo Manchester Debugger"
arch=('i386' 'x86_64')
url="http://brej.org/kmd/"
license=('GPL')
depends=('gtk>=1.2.0' 'glib>=1.2.0')
makedepends=()

provides=('kmd')
conflicts=()

source=(
  "http://brej.org/kmd/dist/KMD-$pkgver.tar.gz"
  "KMD-$pkgver.patch"
)

md5sums=(
  '478e35adc758ca6fecbfd6a49c6d7c50'
  'SKIP'
)

prepare() {
	cd "KMD-$pkgver"
	patch -p1 -i "$srcdir/KMD-$pkgver.patch"
}

build() {
	cd "KMD-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "KMD-$pkgver"
	make DESTDIR="$pkgdir/" install
}
