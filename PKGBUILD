#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=ecryptfs-simple
pkgver=2016.12
pkgrel=1
pkgdesc='A very simple utility for working with eCryptfs.'
arch=(i686 x86_64)
license=(GPL)
url="http://xyne.archlinux.ca/projects/ecryptfs-simple"
depends=(ecryptfs-utils util-linux)
makedepends=(cmake)
source=(
  http://xyne.archlinux.ca/projects/ecryptfs-simple/src/ecryptfs-simple-2016.12.tar.xz
  http://xyne.archlinux.ca/projects/ecryptfs-simple/src/ecryptfs-simple-2016.12.tar.xz.sig
)
sha512sums=(
  ce103db1cd9d0fb808459a4e88065dcfe3c54bc58a5cd0e606e12969a229932070b92fe2c42036c1bc91879df6cb639fa7ce778cc986ce2bd3e4550ec05fceb5
  d27fc6a2032a872a419bb426d5e66e5aee4fe0a0b80ee88d64e3a905d05788cd6f856d268d9ef0f045054cc1a70a769cbb07dbdeb2778748571b7c7a003d7087
)
md5sums=(
  370ad1fb6832cd475b5216397b25d0a0
  34b45620f88246d6644ffd065d201548
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
