# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=fbdump
pkgver=0.4.2
pkgrel=4
pkgdesc="captures the contents of the visible portion of the Linux framebuffer to stdout"
arch=('x86_64')
url="http://www.rcdrummond.net/fbdump/"
license=("GPL")
depends=()
source=(http://www.rcdrummond.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('85ae97c0800a2caf2b04ad7764e3915b')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
