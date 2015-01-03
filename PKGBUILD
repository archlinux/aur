# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
pkgname=lwjgl2
pkgver=2.9.2
pkgrel=1
pkgdesc='Lightweight Java Game Library - for use in game projects in Java.'
arch=(any)
url='http://legacy.lwjgl.org/'
license=('BSD')
changelog=ChangeLog
options=(!strip)
source=("https://downloads.sourceforge.net/project/java-game-lib/Official Releases/LWJGL $pkgver/lwjgl-${pkgver}.zip")
md5sums=('97e35a2ab8ae88e6ec1b27674209d5bb')
sha1sums=('5544c0bec56f4920fb4694ae650eb7ace5dfaf19')

package() {
  cd "$srcdir/$pkgname-$pkgver"
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
