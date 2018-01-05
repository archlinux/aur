# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=rote
pkgver=0.2.8
pkgrel=5
pkgdesc="terminal emulation library"
arch=('x86_64')
url="http://rote.sourceforge.net/"
license=('GPL')
depends=(ncurses)
makedepends=()
source=(http://downloads.sourceforge.net/sourceforge/rote/rote-$pkgver.tar.gz)
md5sums=('9e5901267d9ed239343f55a54d76e48e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -D -m0644 roteprivate.h "$pkgdir"/usr/include/rote/roteprivate.h
}
