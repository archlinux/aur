#Maintainer: Marty Plummer <ntzrmtthihu777 (at) gmail (dot) com>
# Contributor: Thaodan <theodorstormgrade@gmail.com>

pkgname=stargus-git
pkgver=2.4.0
pkgrel=1
pkgdesc="StarCraft Mod that allows you to play StarCraft with the Stratagus engine (git version)"
arch=("i686" "x86_64")
url="https://github.com/Wargus/stargus"
license=('GPL')
depends=('stratagus=2.4.0' 'ffmpeg2theora' 'cdparanoia' 'timidity++' 'gtk2' )
source=("stargus::git://github.com/Wargus/stargus.git")
md5sums=('SKIP')
provides=('stargus=2.4.0')
replaces=('stargus')
conflicts=('stargus')

build() {
  cd $srcdir/stargus
  mkdir -p build
  cd build

  cmake .. -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr -DGAMEDIR=/usr/bin
  make 
}

package()  {
  cd $srcdir/stargus/build
  make  DESTDIR=${pkgdir} install
}
# vim:set ts=2 sw=2 ft=sh et:
