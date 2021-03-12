# Maintainer GI_Jack <GI_Jack@hackermail.com>

pkgname=flcluster
pkgver=1.0.6
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
sha256sums=('da55e3986eb525164ccc505a2e3e63bebc682f6e5b7aea04eba8e3b88dfc5b0f')

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
