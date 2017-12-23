# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=mingw-w64-coveo-linq-git
pkgver=r48.17764bb
pkgrel=1
pkgdesc="A C++ library implementing LINQ operators similar to .NET's (mingw-w64)"
url='https://github.com/coveo/linq'
arch=('any')
license=('APACHE')
makedepends=('git' 'mingw-w64-cmake')
conflicts=('mingw-w64-coveo-linq')
provides=('mingw-w64-coveo-linq')
source=('git://github.com/coveo/linq.git')
sha512sums=('SKIP')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

pkgver() {
  cd linq
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd linq
  for _arch in ${_architectures}; do
    mkdir -p "$pkgdir"/usr/${_arch}/include
    cp -r lib/coveo "$pkgdir"/usr/${_arch}/include
  done
}
