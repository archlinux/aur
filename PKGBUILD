# Maintainer: ohli <olifriedrich at gmail dot com>

pkgname=w_scan_cpp
pkgver=20211128
provides=("w_scan")
conflicts=("w_scan")
pkgrel=1
pkgdesc="A dtv channel scanner based on VDR. Successor of w_scan"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://www.gen2vdr.de/wirbel/w_scan_cpp/index2.html"
replaces=('w_scan')
license=('GPL')
depends=('glibc' 'libcap' 'freetype2' 'fontconfig' 'pugixml' 'librepfunc')
makedepends=('sed' 'make' 'wget' 'git' 'pango')
source=("https://www.gen2vdr.de/wirbel/$pkgname/$pkgname-$pkgver.tar.bz2")
sha256sums=('c3a859a42f338d9c4bbdde2883e32989cd02f72bf2c31bfb18f7b6b23fc61254')

build() {
  cd "$pkgname-$pkgver"
  make -j1 download
  make
}

package() {
  cd "$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install
}

