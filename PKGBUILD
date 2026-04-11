# Maintainer: Peter blackman <peter at pblackman dot plus dot com>
# 11-Apr-2026
#

pkgname=cevomapgen
pkgver=41
pkgrel=1
pkgdesc="External Random Map Generator for C-evo"
arch=('x86_64' 'aarch64')
url="https://git.code.sf.net/p/$pkgname/code"
license=('GPL-3.0-or-later')
depends=('qt6pas' 'glibc' 'libx11' 'hicolor-icon-theme')
makedepends=('git' 'fpc' 'lazarus-qt6')
source=(https://sourceforge.net/projects/$pkgname/files/Source/$pkgname-$pkgver.tar.xz)
# source=("$pkgname-$pkgver".tar.xz)
sha256sums=('7a352e5657914d35fda835e960cc467511d1a85e6d6cf1b23427581ed73c0b43')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make LAZDIR=--lazarusdir=/usr/lib/lazarus all
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" prefix=/usr install
}
