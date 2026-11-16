# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: GreenRaccoon23 <GreenRaccoon a t gmail d o t com>

pkgname=snzip
epoch=1
pkgver=1.0.5
pkgrel=1
pkgdesc="A compression/decompression tool based on snappy"
arch=("i686" "x86_64")
url="https://github.com/kubo/$pkgname"
license=("BSD-2-Clause")
depends=('snappy')
makedepends=('git')

source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('fbb6b816619628f385b62f44a00a1603be157fba6ed2d30de490b0c5e645bff8')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

