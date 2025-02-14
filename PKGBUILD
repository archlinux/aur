# Maintainer: baboon

pkgname="speed-dreams-bin"
pkgver=2.4.0
pkgrel=4
pkgdesc="Speed Dreams is a fork of TORCS which aims to implement exciting new features, improving visual and physics realism. "
arch=('x86_64')
url="https://speed-dreams.net/"
license=('GPL3')
depends=(
speed-dreams-data
glibc
cjson
libcurl-gnutls
enet
expat
gcc-libs
freeglut
libglvnd
libjpeg
minizip
freealut
mesa
openscenegraph
libpng
rhash
sdl2_mixer
libstdc++5
zlib
libxi
libxmu
libxrandr
libarchive
libplib-bin)
conflicts=('speed-dreams-svn' 'speed-dreams-git' 'speed-dreams-appimage' 'speed-dreams')
provides=('speed-dreams')
source=("https://files.speed-dreams.net/public/72ad631c8524ef3abda1dbd6c83e548e")
sha512sums=('SKIP')
options=('!strip')

package() {
  cd $pkgdir
  tar xf $srcdir/data.tar.gz
  echo "Speed Dreams wants /usr/lib/librhash.so.0, which doesn't seem to exist when rhash is installed on Arch."
  if [ ! -f /usr/lib/librhash.so.0 ]; then
    echo "Symlinking /usr/lib/librhash.so /usr/lib/librhash.so.0"
    ln -s /usr/lib/librhash.so $pkgdir/usr/lib/librhash.so.0
  else
    echo "It seems like you already have it though! "
  fi
  ln -s /usr/lib/x86_64-linux-gnu/libsolid.so $pkgdir/usr/lib/
  ln -s /usr/lib/x86_64-linux-gnu/libbroad.so $pkgdir/usr/lib/
  ln -s /usr/lib/x86_64-linux-gnu/libmoto.so $pkgdir/usr/lib
}
