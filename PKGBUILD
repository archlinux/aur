# Maintainer: Kyle Terrien <kyleterrien at gmail dot com>
# Former maintainer: Bernhard Walle <bernhard@bwalle.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

# AUR Category: system

pkgname=xosview
pkgver=1.17
pkgrel=1
pkgdesc="Displays system stats such as cpu, memory, swap, and network usage"
arch=(i686 x86_64)
depends=('gcc-libs' 'libxpm')
license=('GPL')
source=(http://www.pogo.org.uk/~mark/$pkgname/releases/$pkgname-$pkgver.tar.gz)
url="http://www.pogo.org.uk/~mark/xosview/"
sha256sums=('640998e7bd23b875e2556a97b9149a4cca0ac255889f484489b13a888c19b3f1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cd "$srcdir/$pkgname-$pkgver"
  make "DESTDIR=$pkgdir" PREFIX=/usr MANDIR=/usr/share/man install 
}

# vim: ts=2 sw=2 et ft=sh
