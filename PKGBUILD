#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=ecryptfs-simple
pkgver=2016.11.13.4
pkgrel=1
pkgdesc='A very simple utility for working with eCryptfs.'
arch=(i686 x86_64)
license=(GPL)
url="http://xyne.archlinux.ca/projects/ecryptfs-simple"
depends=(ecryptfs-utils util-linux)
makedepends=(cmake)
source=(
  http://xyne.archlinux.ca/projects/ecryptfs-simple/src/ecryptfs-simple-2016.11.13.4.tar.xz
  http://xyne.archlinux.ca/projects/ecryptfs-simple/src/ecryptfs-simple-2016.11.13.4.tar.xz.sig
)
sha512sums=(
  4136679afae213cd1b8c53e33dde4dfe81ca27ef5cb2104ea1e1e4dc3a27cb1b2339eee86a3b224aacc060ae97fab960592afb4a5ff531d169158f54f1ed8106
  c041735da5c72e45f572f601d545415b73318f041fbc759953408d56bc79831678819f2529e3ab19eaa601fb89a355a88e2e1b2eecca3cba3041c9122935e700
)
md5sums=(
  343811ca548396d8cc2c8310f0f33572
  2661f64a11450de231e034b8b98c4c8e
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
