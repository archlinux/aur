# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=libclaw
pkgver=1.7.4
pkgrel=1
pkgdesc="C++ Library Absolutely Wonderful"
arch=('i686' 'x86_64')
url="http://libclaw.sourceforge.net/"
license=('LGPL')
conflicts=('libclaw-svn')
depends=('libjpeg' 'libpng' 'gcc-libs')
makedepends=('cmake' 'boost' 'doxygen')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('0be289da7f43b1892575f14b27860af5d1e1f6961eae11653d64e625fd7924b7')

build() {
  cd $pkgname-$pkgver

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install 
}
