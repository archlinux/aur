# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
_pkgname=lwjgl
pkgname=${_pkgname}2
pkgver=2.9.3
pkgrel=1
pkgdesc='Lightweight Java Game Library - for use in game projects in Java. Legacy version.'
arch=(any)
url='http://legacy.lwjgl.org/'
license=('BSD')
changelog=ChangeLog
options=(!strip)
source=("https://sourceforge.net/projects/java-game-lib/files/Official Releases/LWJGL $pkgver/$_pkgname-${pkgver}.zip")
sha1sums=('6cf7522899c48f0295811a6ae88d93b6f8c21cad')
md5sums=('2318cb02d35c7b7e28b838595aa353ed')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  _sharedir="$pkgdir/usr/share"
  # Install licenses
  install -d "$_sharedir/licenses/$pkgname/3rdparty"
  install -m644 -t "$_sharedir/licenses/$pkgname/3rdparty" doc/3rdparty/*
  install -m644 -t "$_sharedir/licenses/$pkgname" doc/LICENSE
  rm -rf doc/LICENSE doc/3rdparty
  # Install docs
  install -d "$_sharedir/doc/$pkgname"
  install -m644 -t "$_sharedir/doc/$pkgname" doc/*
  rm -rf doc
  # Install library files
  install -d "$_sharedir/$pkgname"
  mv * "$_sharedir/$pkgname"
}

# vim:set ts=2 sw=2 et:
