# Maintainer: Peter blackman <peter at pblackman dot plus dot com>
# 22-Sep-2026
#

pkgname=cevomapgen
pkgver=43
pkgrel=1
pkgdesc="External Random Map Generator for C-evo"
arch=('x86_64' 'aarch64')
url="https://git.code.sf.net/p/$pkgname/code"
license=('GPL-3.0-or-later')
depends=('qt6pas' 'glibc' 'libx11' 'hicolor-icon-theme')
makedepends=('fpc' 'lazarus-qt6')
source=(https://sourceforge.net/projects/$pkgname/files/Source/$pkgname-$pkgver.tar.xz)
# source=("$pkgname-$pkgver".tar.xz)
sha256sums=('14144e8da7791efaddbb7f675a7c5db3dab1a07106a1aac0c9f812f3522a8f88')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make -B LAZDIR=--lazarusdir=/usr/lib/lazarus all
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" prefix=/usr install
}
