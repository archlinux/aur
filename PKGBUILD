# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
# Contributor: Alexandre Becoulet <alexandre.becoulet@free.fr>

pkgname=libdvbcsa
pkgver=1.1.0
pkgrel=2
pkgdesc="A free implementation of the DVB Common Scrambling Algorithm"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="http://www.videolan.org/developers/libdvbcsa.html"
license=('GPL3')
depends=('glibc')
source=("http://download.videolan.org/pub/videolan/libdvbcsa/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('478ab1ca56ca58d2667da6ce22f74e39')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
