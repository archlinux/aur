# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
pkgname=lwjgl
pkgver=3.0.0
pkgrel=1
pkgdesc='Lightweight Java Game Library - for use in game projects in Java.'
arch=(any)
url='https://lwjgl.org/'
license=('BSD')
changelog=ChangeLog
options=(!strip)
source=("$pkgname-$pkgver.zip::https://github.com/LWJGL/lwjgl3/releases/download/$pkgver/$pkgname.zip")
md5sums=('1c3148216400988d731b3987993a0a43')
sha1sums=('1f309cbd7a687a0e41636b167a41101b4f48854c')

package() {
  _sharedir="$pkgdir/usr/share"
  # Install licenses
  install -d "$_sharedir/licenses/$pkgname/3rdparty"
  install -m644 -t "$_sharedir/licenses/$pkgname/3rdparty" doc/3rdparty/*
  install -m644 -t "$_sharedir/licenses/$pkgname" LICENSE
  rm -rf LICENSE doc/3rdparty
  # Install docs
  install -d "$_sharedir/doc/$pkgname"
  install -m644 -t "$_sharedir/doc/$pkgname" doc/*
  # Install library files
  install -d "$_sharedir/$pkgname/jar"
  install -m644 -t "$_sharedir/$pkgname/jar" jar/*
  install -d "$_sharedir/$pkgname/native"
  install -m644 -t "$_sharedir/$pkgname/native" native/*
  install -m644 -t "$_sharedir/$pkgname" build.txt src.zip
}

# vim:set ts=2 sw=2 et:
