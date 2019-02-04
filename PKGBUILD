# Maintainer: Alexandros Theodotou <alex at zrythm dot org>

pkgname=libcyaml
pkgver=0.1.0
pkgrel=1
pkgdesc="Free GNU/Linux music production system (DAW)"
arch=('x86_64')
url="https://git.zrythm.org/zrythm/libcyaml"
license=('GPL3')
depends=('libyaml')
source=("https://git.zrythm.org/zrythm/libcyaml/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('SKIP')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/lib/pkgconfig $pkgdir/usr/include
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
