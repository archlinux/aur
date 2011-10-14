# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
pkgname=lwjgl
pkgver=2.8.0
pkgrel=1
pkgdesc="Lightweight Java Game Library - for use in game projects in Java."
arch=(any)
url="http://lwjgl.org/"
license=('BSD')
changelog=ChangeLog
source=(http://downloads.sourceforge.net/java-game-lib/$pkgname-$pkgver.zip)
md5sums=('9e701c32a5301f61468a7a41574edaec')
sha1sums=('7705aa87f93fe07233f32f7573c4681e6c497aa6')

package() {
  _srcdir="$srcdir/$pkgname-$pkgver"
  cd "$_srcdir"
  _sharedir="$pkgdir/usr/share"
  # Install licenses
  install -d $_sharedir/licenses/$pkgname/3rdparty
  install -m644 -t $_sharedir/licenses/$pkgname/3rdparty doc/3rdparty/*
  install -m644 -t $_sharedir/licenses/$pkgname doc/LICENSE
  rm -rf doc/LICENSE doc/3rdparty
  # Install docs
  install -d $_sharedir/doc/$pkgname
  install -m644 -t $_sharedir/doc/$pkgname doc/*
  rm -rf doc
  # Install library files
  install -d $_sharedir/$pkgname
  mv * $_sharedir/$pkgname
}

# vim:set ts=2 sw=2 et:
