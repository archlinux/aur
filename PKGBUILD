# Contributor: sekret
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Henning Garus <henning.garus@gmail.com>
# Contributor: Joshua Stiefer <facedelajunk@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=wordgrinder
pkgver=0.6
pkgrel=1
pkgdesc="A word processor for processing words."
url="http://cowlark.com/wordgrinder/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('lua52' 'lua52-filesystem' 'zlib')
source=("https://github.com/davidgiven/$pkgname/archive/${pkgver}.tar.gz")
md5sums=('f766ed92430073a12494f626476b5488')
sha1sums=('f2bc7d7f1b32a2b1a68978086e046564420df78a')
sha256sums=('3459cab32ca89d8585aa96ef0b9db2ac3802773223786991e48b3c62e2ee7eed')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

