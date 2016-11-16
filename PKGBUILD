#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=ecryptfs-simple
pkgver=2016.11.16.1
pkgrel=1
pkgdesc='A very simple utility for working with eCryptfs.'
arch=(i686 x86_64)
license=(GPL)
url="http://xyne.archlinux.ca/projects/ecryptfs-simple"
depends=(ecryptfs-utils util-linux)
makedepends=(cmake)
source=(
  http://xyne.archlinux.ca/projects/ecryptfs-simple/src/ecryptfs-simple-2016.11.16.1.tar.xz
  http://xyne.archlinux.ca/projects/ecryptfs-simple/src/ecryptfs-simple-2016.11.16.1.tar.xz.sig
)
sha512sums=(
  a1b4cd22e50d8078fa675613918c86c60173eb369b73817e5568053a994b03a40cfa33655908c46bea20965056d2bbd4098ae5ea150cce868229d6705336aa00
  a20a9b0155a2fc754e538eb18acca7266042abab6bd669ae3af6c452884407fd755ba69f64af2b252d392b0fccf65aa7de060bc99e528663fccba36e4aa023bf
)
md5sums=(
  23d81f96277a026bac98b5a847503007
  69e565f3487b91b81d93db00d6e4bfca
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
