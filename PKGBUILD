# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=xrestop
pkgver=0.4
pkgrel=6
pkgdesc="Uses the X-Resource extension to provide 'top' like statistics"
arch=('x86_64')
url="http://freedesktop.org/wiki/Software/xrestop"
license=('GPL')
depends=('libxres' 'ncurses')
source=(https://sources.archlinux.org/other/community/xrestop/xrestop-$pkgver.tar.gz)
md5sums=('d8a54596cbaf037e62b80c4585a3ca9b')

build() {
  cd "$srcdir/xrestop-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/xrestop-$pkgver"
  make DESTDIR="$pkgdir" install
}
