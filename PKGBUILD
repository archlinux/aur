# Maintainer: baboon

pkgname="speed-dreams"
pkgver=2.4.0
pkgrel=2
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
glu
libglvnd
libjpeg6-turbo
minizip
openal
mesa
openscenegraph
libpng
rhash
sdl2-compat
sdl2_mixer
libstdc++5
zlib-ng
libarchive)
conflicts=('speed-dreams-svn' 'speed-dreams-git' 'speed-dreams-appimage')
source=("https://files.speed-dreams.net/public/72ad631c8524ef3abda1dbd6c83e548e")
sha512sums=('SKIP')
options=('!strip')

package() {
  cd "$pkgdir"
  tar xf "$srcdir/data.tar.gz"
  echo "Speed Dreams wants /usr/lib/librhash.so.0, which doesn't seem to exist when rhash is installed on Arch."
  if [ ! -f /usr/lib/librhash.so.0 ]; then
    echo "Symlinking /usr/lib/librhash.so /usr/lib/librhash.so.0"
    ln -s /usr/lib/librhash.so $pkgdir/usr/lib/librhash.so.0
  else
    echo "It seems like you already have it though! "
  fi
}
