# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=kmplayer
pkgver=0.11.3.d
_pkgver=0.11.3d
pkgrel=1
pkgdesc="Video player plugin for Konqueror and basic MPlayer/Xine/ffmpeg/ffserver/VDR frontend for KDE"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
url="http://kmplayer.kde.org"
depends=('kdebase-runtime' 'cairo')
makedepends=('cmake' 'automoc4' 'gtk2')
optdepends=('gtk2: for the Netscape plugin player')
install=$pkgname.install
source=("http://kmplayer.kde.org/pkgs/$pkgname-$_pkgver.tar.bz2")
md5sums=('a652d00370e0940e6bd9cf51b32770c4')

build() {
  cd $srcdir
  mkdir build
  cd build
  cmake ../$pkgname-$_pkgver -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $srcdir/build
  make DESTDIR=$pkgdir install
}
