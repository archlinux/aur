# Maintainer: Peter blackman <peter at pblackman dot plus dot com>
# 30-Mar-2026
#

pkgname=cevomapgen
pkgver=40
pkgrel=1
pkgdesc="External Random Map Generator for C-evo"
arch=('x86_64' 'aarch64')
url="https://git.code.sf.net/p/$pkgname/code"
license=('GPL-3.0-or-later')
depends=('qt6pas' 'glibc' 'libx11' 'hicolor-icon-theme')
makedepends=('git' 'fpc' 'lazarus-qt6')
# source=(https://sourceforge.net/projects/$pkgname/files/Source/$pkgname-$pkgver.tar.xz)
source=("$pkgname-$pkgver".tar.xz)
sha256sums=('5c9659b9b47a0e5a2c3824f3474df350001087eeec7ae67bced67f76f66272c9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make LAZDIR=--lazarusdir=/usr/lib/lazarus all
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" prefix=/usr install
}
