# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=kmplayer
pkgver=0.11.5.a
_tag=0.11.5a
pkgrel=1
pkgdesc="Video player plugin for Konqueror and basic MPlayer/Xine/ffmpeg/ffserver/VDR frontend for KDE"
arch=(i686 x86_64)
license=(GPL LGPL FDL)
url="http://kmplayer.kde.org"
depends=(kdebase-runtime cairo)
makedepends=(cmake automoc4 gtk2)
optdepends=('gtk2: for the Netscape plugin player')
#source=("http://kmplayer.kde.org/pkgs/$pkgname-$pkgver.tar.bz2")
source=("http://quickgit.kde.org/?p=kmplayer.git&a=snapshot&tag=$_tag&fmt=tbz2")
md5sums=('9cb8d6e82e82a1133db6505de7da3a5a')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
