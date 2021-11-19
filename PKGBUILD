# Maintainer GI_Jack <GI_Jack@hackermail.com>

pkgname=flcluster
pkgver=1.0.7
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
sha256sums=('3df2d10b7886b72b857e972a319c6af4f476ba5e60ad200b4de46978395bc161')

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
