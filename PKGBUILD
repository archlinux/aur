# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=fbdump
pkgver=0.4.2
pkgrel=6
pkgdesc="captures the contents of the visible portion of the Linux framebuffer to stdout"
arch=('x86_64')
url="https://www.rcdrummond.net/fbdump/"
license=("GPL")
depends=('glibc')
source=("https://www.rcdrummond.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('c4d521a86229b3106cf69786008ad94f899da5288a19a067deae84951880722d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
