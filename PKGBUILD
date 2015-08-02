# Maintainer: dhead666 <myfoolishgames@gmail.com>
# https://github.com/dhead666/archlinux-pkgbuilds
#
# package version generated with # git log -1 --date=short --format="%cd.%h" | tr -d '-'

pkgname=kodi-devel-adsp-biquad-filters
_gitname=adsp.biquad.filters
pkgver=20150719.b6a31a9
_gitver=b6a31a90b7a0213b9362e3ec0ddb7d49aa71ac55
pkgrel=2
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
