# Maintainer: Nahuel Alonso <blizzard.nna@gmail.com>
pkgname=webmc
pkgver="0.1"
pkgrel=2
pkgdesc="ffmpeg Qt5 client for quick webms convertions"
arch=(x86_64)
url="https://github.com/nahwar/webmc"
license=('GPL')
depends=(ffmpeg qt5-base xterm)
makedepends=(coreutils git qt5-base gcc)
source=(git+"https://github.com/nahwar/webmc.git")
md5sums=('SKIP')

prepare() {
  cd $srcdir/webmc/build
  make
}
package() {
	mv "$srcdir/webmc/build/webmqt" "$srcdir/webmc/build/webmc"
	install -Dm755 "$srcdir/webmc/build/webmc" "$pkgdir/usr/bin/webmc"
}
