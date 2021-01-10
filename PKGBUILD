# Maintainer: ohli <olifriedrich at gmail dot com>

pkgname=w_scan_cpp
pkgver=20201224
pkgrel=1
pkgdesc="A dtv channel scanner based on VDR. Successor of w_scan"
arch=('i686' 'x86_64' 'armv6h')
url="https://www.gen2vdr.de/wirbel/w_scan_cpp/index2.html"
replaces=('w_scan')
license=('GPL')
depends=('glibc' 'libcap' 'freetype2' 'fontconfig') 
makedepends=('sed' 'make' 'wget' 'git')
source=("https://www.gen2vdr.de/wirbel/$pkgname/$pkgname-$pkgver.tar.bz2")
sha256sums=('7b4151f8430c980310eb7cfb8d7179e44231239f51d6c4559a5f55c9b7c6cbdc')  

build() {
  #cd "$pkgname-$pkgver"
  make -j1 download
  make
}

package() {
  #cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/usr/bin" install
  install -Dm644 README -t "$pkgdir/usr/share/doc/$pkgname"
}

