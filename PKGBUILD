# $Id: PKGBUILD 310007 2017-11-15 14:11:34Z foutrelis $
# Maintainer: dorphell <dorphell@archlinux.org>

pkgname=naim
pkgver=0.11.8.3.2
pkgrel=4
pkgdesc="An ncurses AOL Instant Messenger and IRC client."
arch=('x86_64')
license=('GPL2')
url="http://naim.n.ml.org"
depends=('ncurses')
source=("http://naim.googlecode.com/files/$pkgname-$pkgver.tar.bz2")
options=("!makeflags")
md5sums=('c9622e3f75d56310829f98fa4dae1f78')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
