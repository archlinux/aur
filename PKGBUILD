#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=ecryptfs-simple
pkgver=2017
pkgrel=2
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
  5fc7b9fcee732dcb8ad4e2860b72ec4916c81ef4485a4ba422bdbee8965749f60e4983a8499ecca47b3317651d6ad26c049b01bb4db7ec1c7f6b54d6a0dbda10
)
md5sums=(
  e8b398ddedbc78bc275c584a9eba6d84
  046f70ee71a11d3c43a7c7514465c5fe
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
