#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=ecryptfs-simple
pkgver=2017
pkgrel=5
pkgdesc='A very simple utility for working with eCryptfs.'
arch=(i686 x86_64)
license=(GPL)
url="https://xyne.dev/projects/ecryptfs-simple"
depends=(ecryptfs-utils util-linux)
makedepends=(cmake)
source=(
  https://xyne.dev/projects/ecryptfs-simple/src/ecryptfs-simple-2017.tar.xz
  https://xyne.dev/projects/ecryptfs-simple/src/ecryptfs-simple-2017.tar.xz.sig
)
sha512sums=(
  2144a09227c28e1dc66eafb747f73c85f22a9da8a45bf6bf92af0b670ae8148387f4ef0fc25b9bdd385fd47ffb76169adb69556cec967b84cc37c1e092495ef2
  c298a8203dce31505cb9eda20e2dbf48e15bfc38f3d75bcf237eb25affa28dca201829eec23f2c78b6ffd218302ec17cbc155087e2dd89f6d9a82facf39bc275
)
md5sums=(
  e8b398ddedbc78bc275c584a9eba6d84
  8452526d4f2a4b15952424512a15b55a
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

build ()
{
  mkdir -p "$srcdir/build"
  cd -- "$srcdir/build"
  cmake ../"$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package ()
{
  cd -- "$srcdir/build"
  make install DESTDIR="$pkgdir"
}
# vim: set ts=2 sw=2 et:
