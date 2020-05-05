pkgname=war1gus-git
pkgver=2.4.3
pkgrel=1
pkgdesc="Warcraft1 Mod that allows you to play Warcraft1 with the Stratagus engine (git version)"
arch=("i686" "x86_64")
url="https://github.com/Wargus/war1gus"
license=('GPL')
depends=('stratagus' 'ffmpeg2theora' 'cdparanoia' 'timidity++' 'gtk2' 'imagemagick')
source=("war1gus::git://github.com/Wargus/war1gus.git")
md5sums=('SKIP')
provides=('war1gus=2.4.1')
replaces=('war1gus')
conflicts=('war1gus')

build() {
  cd $srcdir/war1gus
  mkdir -p build
  cd build

  cmake .. -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr -DGAMEDIR=/usr/bin
  make
}

package()  {
  cd $srcdir/war1gus/build
  make  DESTDIR=${pkgdir} install
}
