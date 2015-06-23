# Contributor: sekret
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Henning Garus <henning.garus@gmail.com>
# Contributor: Joshua Stiefer <facedelajunk@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=wordgrinder
pkgver=0.5.2.1
pkgrel=2
pkgdesc="A word processor for processing words."
url="http://wordgrinder.sourceforge.net/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('lua52' 'lua52-filesystem' 'zlib')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('5410114f6617da254481a52cfb1dca95')
sha1sums=('161702ccbe22ccc4d1b39e966e6ae1e0cc8f2255')
sha256sums=('7e0d5345e996a6d0dec33cd485577cf86b33b21845477e901705d971bda442f5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

