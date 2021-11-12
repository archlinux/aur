# Maintainer: ohli <olifriedrich at gmail dot com>

pkgname=w_scan_cpp
pkgver=20211009
provides=("w_scan")
conflicts=("w_scan")
pkgrel=2
pkgdesc="A dtv channel scanner based on VDR. Successor of w_scan"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://www.gen2vdr.de/wirbel/w_scan_cpp/index2.html"
replaces=('w_scan')
license=('GPL')
depends=('glibc' 'libcap' 'freetype2' 'fontconfig' 'pugixml') 
makedepends=('sed' 'make' 'wget' 'git' 'pango')
source=("https://www.gen2vdr.de/wirbel/$pkgname/$pkgname-$pkgver.tar.bz2")
sha256sums=('080867eef8a3ebb8fa9402a65167365e208c5057073caaf58e1250825f7f38d3')

build() {
  cd "$pkgname-$pkgver"
  make -j1 download
  make
}

package() {
  cd "$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install
}

