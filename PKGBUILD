# Maintainer: dhead666 <myfoolishgames@gmail.com>
# https://github.com/dhead666/archlinux-pkgbuilds
#
# package version generated with # git log -1 --date=short --format="%cd.%h" | tr -d '-'

pkgname=kodi-devel-adsp-basic
_gitname=adsp.basic
pkgver=20151015.8901516
_gitver=89015163135c78375dbc54eca81e1d4aa91ca1d2
pkgrel=1
pkgdesc='Basic ADSP Processor addon for Kodi'
arch=('i686' 'x86_64')
url="https://github.com/kodi-adsp/$_gitname"
license=('GPL')
groups=('kodi-devel')
makedepends=('cmake' 'kodi-devel-platform' 'kodi-devel-libplatform')
depends=('kodi-devel' 'libsamplerate')
#conflicts=('')
#replaces=('')
source=("https://github.com/kodi-adsp/$_gitname/archive/$_gitver.tar.gz")
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
