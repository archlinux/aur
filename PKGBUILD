#Maintainer: Marty Plummer <ntzrmtthihu777 (at) gmail (dot) com>
# Contributor: Thaodan <theodorstormgrade@gmail.com>

pkgname=wargus-git
pkgver=2.4.0
pkgrel=1
pkgdesc="Warcraft2 Mod that allows you to play Warcraft2 with the Stratagus engine (git version)"
arch=("i686" "x86_64")
url="https://github.com/Wargus/wargus"
license=('GPL')
depends=('stratagus=2.4.0' 'ffmpeg2theora' 'cdparanoia' 'timidity++' 'gtk2' )
source=("wargus::git://github.com/Wargus/wargus.git")
md5sums=('SKIP')
provides=('wargus=2.4.0')
replaces=('wargus')
conflicts=('wargus')

build() {
  cd $srcdir/wargus
  mkdir -p build
  cd build

  cmake .. -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr -DGAMEDIR=/usr/bin
  make 
}

package()  {
  cd $srcdir/wargus/build
  make  DESTDIR=${pkgdir} install
}
# vim:set ts=2 sw=2 ft=sh et:
