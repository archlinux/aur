#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=ecryptfs-simple
pkgver=2017
pkgrel=1
pkgdesc='A very simple utility for working with eCryptfs.'
arch=(i686 x86_64)
license=(GPL)
url="http://xyne.archlinux.ca/projects/ecryptfs-simple"
depends=(ecryptfs-utils util-linux)
makedepends=(cmake)
source=(
  http://xyne.archlinux.ca/projects/ecryptfs-simple/src/ecryptfs-simple-2017.tar.xz
  http://xyne.archlinux.ca/projects/ecryptfs-simple/src/ecryptfs-simple-2017.tar.xz.sig
)
sha512sums=(
  2144a09227c28e1dc66eafb747f73c85f22a9da8a45bf6bf92af0b670ae8148387f4ef0fc25b9bdd385fd47ffb76169adb69556cec967b84cc37c1e092495ef2
  f3c6e1bcef61586fb3abc6b261debeb44c83a4c3e4b447bd119f0f3fcb0d2f344587f803254af47ec8735253015eb6a7920d23687e6b79b5978b6c53bb63b7ac
)
md5sums=(
  e8b398ddedbc78bc275c584a9eba6d84
  9dc122d57532da252305fb5c02f04d39
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

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
