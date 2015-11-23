# Maintainer: dhead666 <myfoolishgames@gmail.com>
# https://github.com/dhead666/archlinux-pkgbuilds
#
# package version generated with # git log -1 --date=short --format="%cd.%h" | tr -d '-'

pkgname=kodi-devel-pvr-mediaportal-tvserver
_gitname=pvr.mediaportal.tvserver
pkgver=20150920.0e12d06
_gitver=0e12d06c575a7567025dfb4f8cdc758340f2727b
pkgrel=1
pkgdesc='MediaPortal PVR client addon for Kodi'
arch=('i686' 'x86_64')
url="https://github.com/kodi-pvr/$_gitname"
license=('GPL')
groups=('kodi-devel')
makedepends=('cmake' 'kodi-devel-platform' 'kodi-devel-libplatform')
depends=('kodi-devel' 'tinyxml')
source=("https://github.com/kodi-pvr/$_gitname/archive/$_gitver.tar.gz")
md5sums=('SKIP')

_prefix='/usr'

build() {
  msg "Starting make..."
  
  cd "$srcdir/$_gitname-$_gitver"
  mkdir build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=$_prefix \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
}

package() {
  cd "$srcdir/$_gitname-$_gitver/build"
  make DESTDIR="$pkgdir" install
}
