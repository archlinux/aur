# Maintainer: dhead666 <myfoolishgames@gmail.com>
# https://github.com/dhead666/archlinux-pkgbuilds
#
# package version generated with # git log -1 --date=short --format="%cd.%h" | tr -d '-'

pkgname=kodi-devel-visualization-waveform
_gitname=visualization.waveform
pkgver=20151109.43956cb
_gitver=43956cbfe1ed03612574a19a8a6e3fb829d29e87
pkgrel=1
pkgdesc='Waveform visualization addon for Kodi'
arch=('i686' 'x86_64')
url="https://github.com/notspiff/$_gitname"
license=('GPL')
groups=('kodi-devel')
makedepends=('cmake')
depends=('kodi-devel')
source=("https://github.com/notspiff/$_gitname/archive/$_gitver.tar.gz")
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
