# Maintainer: ohli <olifriedrich at gmail dot com>

pkgname=w_scan_cpp
pkgver=20210608
provides=("w_scan")
conflicts=("w_scan")
pkgrel=2
pkgdesc="A dtv channel scanner based on VDR. Successor of w_scan"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://www.gen2vdr.de/wirbel/w_scan_cpp/index2.html"
replaces=('w_scan')
license=('GPL')
depends=('glibc' 'libcap' 'freetype2' 'fontconfig' 'pugixml') 
makedepends=('sed' 'make' 'wget' 'git')
source=("https://www.gen2vdr.de/wirbel/$pkgname/$pkgname-$pkgver.tar.bz2")
sha256sums=('da04f5a490b08b8dcb4cd8218fee779f55a23a53ad0010a9323d7055fabdda1b')

build() {
  cd "$pkgname-$pkgver"
  make -j1 download
  make
}

package() {
  cd "$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install
}

