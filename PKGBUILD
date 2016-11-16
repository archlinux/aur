#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=ecryptfs-simple
pkgver=2016.11.16
pkgrel=1
pkgdesc='A very simple utility for working with eCryptfs.'
arch=(i686 x86_64)
license=(GPL)
url="http://xyne.archlinux.ca/projects/ecryptfs-simple"
depends=(ecryptfs-utils util-linux)
makedepends=(cmake)
source=(
  http://xyne.archlinux.ca/projects/ecryptfs-simple/src/ecryptfs-simple-2016.11.16.tar.xz
  http://xyne.archlinux.ca/projects/ecryptfs-simple/src/ecryptfs-simple-2016.11.16.tar.xz.sig
)
sha512sums=(
  1bb65881b23ae52e32d527cebf0e0acf1d5d5ce2417ddc86483c3fba38a21ed725f836cf5256a864a4a4e99ab0c7875e779eb96ed6af66912e52ca364b502c28
  cebedd8267f3a2b2508df41f37a75f9a6ca70eacf56b754aadcf8f700662ebd8d5cc0982eb2699a74a526753f7089bc22a723669145cd0f86f5b85ace69f5e00
)
md5sums=(
  d38494fdaedcdadf7db44efb82982564
  ccaa8a3e92ae858f6cc5baec12da4ad0
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
