# Maintainer: dhead666 <myfoolishgames@gmail.com>
# https://github.com/dhead666/archlinux-pkgbuilds
#
# package version generated with # git log -1 --date=short --format="%cd.%h" | tr -d '-'

pkgname=kodi-devel-adsp-biquad-filters
_gitname=adsp.biquad.filters
pkgver=20151023.1746fe4
_gitver=1746fe469965c6e701133f36ff0b7a42805f5c1d
pkgrel=1
pkgdesc='Biquad filter ADSP addon for Kodi'
arch=('i686' 'x86_64')
url="https://github.com/kodi-adsp/$_gitname"
license=('GPL')
groups=('kodi-devel')
makedepends=('cmake' 'kodi-devel-platform' 'kodi-devel-libplatform')
depends=('kodi-devel' 'tinyxml' 'asplib')
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
