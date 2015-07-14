# $Id: PKGBUILD 100340 2013-11-02 11:47:21Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Johannes Sjolund <j.sjolund@gmail.com>

_pkgname=mxml
pkgname=$_pkgname-static
pkgver=2.7
pkgrel=2
pkgdesc="A small XML parsing library (static library)"
arch=('i686' 'x86_64')
url="http://www.minixml.org/"
license=('LGPL')
source=("http://www.msweet.org/files/project3/$_pkgname-$pkgver.tar.gz")
md5sums=('76f2ae49bf0f5745d5cb5d9507774dc9')
options=(staticlibs)
depends=($_pkgname)

build() {
  cd "$srcdir/$_pkgname-$pkgver"
#  [ "$CARCH" = x86_64 ] && export CFLAGS="$CFLAGS -fPIC"
  ./configure --prefix=/usr --disable-shared
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm644 libmxml.a "$pkgdir/usr/lib/libmxml.a"
}
