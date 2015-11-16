# Maintainer: dhead666 <myfoolishgames@gmail.com>
# https://github.com/dhead666/archlinux-pkgbuilds
#
# package version generated with # git log -1 --date=short --format="%cd.%h" | tr -d '-'

pkgname=kodi-devel-adsp-freesurround
_gitname=adsp.freesurround
pkgver=20151014.f0c6bf0
_gitver=f0c6bf0075da350f6c889fc28dcf21480637e6ea
pkgrel=1
pkgdesc='FreeSurround ADSP addon for Kodi'
arch=('i686' 'x86_64')
url="https://github.com/kodi-adsp/$_gitname"
license=('GPL')
groups=('kodi-devel')
makedepends=('cmake' 'kodi-devel-platform' 'kodi-devel-libplatform')
depends=('kodi-devel')
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
