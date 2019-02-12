# Maintainer: Alexandros Theodotou <alex at alextee dot org>

pkgname=zrythm
pkgver=master
pkgrel=2
pkgdesc="Free GNU/Linux music production system (DAW)"
arch=('x86_64')
url="https://git.zrythm.org/zrythm/zrythm"
license=('GPL3')
depends=('gtk3' 'lv2' 'lilv' 'suil' 'jack' 'libsndfile' 'libsmf' 'libdazzle' 'libcyaml'
         'breeze-icons' 'portaudio' 'ffmpeg')
source=("https://git.zrythm.org/zrythm/zrythm/-/archive/$pkgver/zrythm-$pkgver.tar.gz")
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
