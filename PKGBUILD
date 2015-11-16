# Maintainer: dhead666 <myfoolishgames@gmail.com>
# https://github.com/dhead666/archlinux-pkgbuilds
#
# package version generated with # git log -1 --date=short --format="%cd.%h" | tr -d '-'

pkgname=kodi-devel-audiodecoder-nosefart
_gitname=audiodecoder.nosefart
pkgver=20150806.bfab543
_gitver=bfab543bae0d9855538cf03e78ea9cd5e3b9750e
pkgrel=1
pkgdesc='Nosefart decoder addon for Kodi'
arch=('i686' 'x86_64')
url="https://github.com/notspiff/$_gitname"
license=('GPL')
groups=('kodi-devel')
makedepends=('cmake' 'kodi-devel-platform' 'kodi-devel-libplatform')
depends=('kodi-devel')
source=("https://github.com/notspiff/$_gitname/archive/$_gitver.tar.gz")
md5sums=('SKIP')

_prefix='/usr'

build() {
  cd "$srcdir/$_gitname-$_gitver"
  mkdir -p build && pushd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=$_prefix \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
  popd
}

package() {
  cd "$srcdir/$_gitname-$_gitver/build"
  make DESTDIR="$pkgdir" install
}
