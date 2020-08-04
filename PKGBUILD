# Maintainer GI_Jack <GI_Jack@hackermail.com>

pkgname=flcluster
pkgver=1.0.4
pkgrel=1
pkgdesc="W1HKJ's program for accessing dxcluster nodes(Ham Radio)"
arch=('x86_64' 'i686')
url="http://www.w1hkj.com/flcluster-help/"
license=('GPL')
groups=('w1hkj')
depends=('libxft' 'hamlib' 'fltk' 'libjpeg' 'portaudio' 'flxmlrpc' 'libpng'
	 'libsamplerate' 'libsndfile' 'pulseaudio' 'xmlrpc-c')
optdepends=('fldigi: Intergrate with fldigi')

source=("http://www.w1hkj.com/files/flcluster/flcluster-${pkgver}.tar.gz")
sha256sums=('60af792365dc14ac1f67d53548f7c405076cff3324818005bc64483640cbc6f8')


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
