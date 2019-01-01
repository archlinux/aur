# Maintainer: Alexandros Theodotou <alex at alextee dot online>

pkgname=zrythm-git
pkgver=master
pkgrel=3
pkgdesc="Free GNU/Linux music production system (DAW)"
arch=('x86_64')
url="https://gitlab.com/alextee/zrythm"
license=('GPL')
depends=('gtk3' 'lv2' 'lilv-git' 'suil-git' 'jack' 'libsndfile' 'libsmf')
source=("https://gitlab.com/alextee/zrythm/-/archive/$pkgver/zrythm-$pkgver.tar.gz")
md5sums=('SKIP')

prepare() {
	cd "zrythm-$pkgver"
}

build() {
	cd "zrythm-$pkgver"
  autoreconf -fi
	./configure --prefix=/usr --enable-aur-build
	make
}

package() {
	cd "zrythm-$pkgver"
	make DESTDIR="$pkgdir/" install
}

