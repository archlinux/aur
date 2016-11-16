#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=ecryptfs-simple
pkgver=2016.11.15.3
pkgrel=1
pkgdesc='A very simple utility for working with eCryptfs.'
arch=(i686 x86_64)
license=(GPL)
url="http://xyne.archlinux.ca/projects/ecryptfs-simple"
depends=(ecryptfs-utils util-linux)
makedepends=(cmake)
source=(
  http://xyne.archlinux.ca/projects/ecryptfs-simple/src/ecryptfs-simple-2016.11.15.3.tar.xz
  http://xyne.archlinux.ca/projects/ecryptfs-simple/src/ecryptfs-simple-2016.11.15.3.tar.xz.sig
)
sha512sums=(
  e34b6e474df68fe2be7a83dc89a4b41448982d4930e8032990c1c25f5988868424f12558c700a36c902980de30c47fc307980f94e787f6446a57c443ea9c7e9a
  12ec266068187d22c2fcd0bde7de972198e40754e8c40583cda4ea6f91479425e50fa257933bad95dad5032202752b1601df7b27fa229340db932036ab782cb4
)
md5sums=(
  d9b36ca53bc44cea9525bd37bb936682
  d4c4a983fbd17e2c87584fb183ace529
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
