# $Id: PKGBUILD 110980 2014-05-11 18:49:23Z bgyorgy $
# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=soup-sharp
pkgver=2.42.2
pkgrel=2
pkgdesc="C# bindings for libsoup"
arch=('i686' 'x86_64')
url="https://github.com/xDarkice/soup-sharp"
license=('LGPL')
depends=('gtk-sharp-3' 'libsoup')
source=(https://github.com/xDarkice/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('a318c69ecf8aa74ab25467e4337288d79b69abd6f68e6739d9f615148b9174f3')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/gmcs/mcs/' configure{,.ac}
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
