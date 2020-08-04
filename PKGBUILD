# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=flaa
pkgver=1.0.2
pkgrel=1
pkgdesc="W1GKJ's control program for use with the RigExpert AA-xxxx series of antenna analyzers"
arch=('i686' 'x86_64')
url="http://www.w1hkj.com/flaa-help/index.html"
license=('GPL')
groups=('w1hkj')
depends=('libxft' 'hamlib' 'fltk' 'libjpeg' 'portaudio' 'flxmlrpc' 'libpng'
	 'libsamplerate' 'libsndfile' 'pulseaudio' 'xmlrpc-c')
source=("http://www.w1hkj.com/files/flaa/flaa-${pkgver}.tar.gz")
sha256sums=('a66faaae0f29d9ecce7ee37c1e0e7fe5731133e625d9e9dd898a5076ed6ecb01')

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
