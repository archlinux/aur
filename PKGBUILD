# Maintainer: Florian Schweikert <aur@ist-total.org>
pkgname=sndcut
pkgver=1.9
pkgrel=1
pkgdesc="Let's you generated LPs that you can laser cut from audio files.
 sndcut is a program the generates LP records from audio files - it generates a SVG file that you can laser cut."
arch=('x86' 'x86_64')
url="https://github.com/kallaballa/sndcut"
license=('GPL2')
depends=('libsndfile' 'libsamplerate' 'boost-libs')
makedepends=('boost' 'cmake')
source=(https://github.com/kallaballa/$pkgname/archive/v$pkgver.zip)
sha1sums=('b9f9346aaab40b3dbf37a5c056c2109163f4fbc1')

build() {
  cd $pkgname-$pkgver
  ./build_deps.sh
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
