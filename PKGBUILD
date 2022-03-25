# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>

pkgname=flcluster
pkgver=1.0.7
pkgrel=2
pkgdesc="Amateur (Ham) Radio program for accessing dxcluster nodes."
arch=('x86_64' 'i686')
url="http://www.w1hkj.com/flcluster-help/"
license=('GPL')
depends=('hamlib' 'fltk' 'libjpeg' 'portaudio' 'flxmlrpc' 'libsamplerate'
	 'libsndfile' 'pulseaudio' 'xmlrpc-c' 'hamradio-menus')
optdepends=('fldigi: Intergrate with fldigi')
source=("http://www.w1hkj.com/files/flcluster/flcluster-${pkgver}.tar.gz")

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
md5sums=('5932fa07817d33346cc2c82b80007a40')
sha256sums=('3df2d10b7886b72b857e972a319c6af4f476ba5e60ad200b4de46978395bc161')
