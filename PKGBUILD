#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=ecryptfs-simple
pkgver=2016.11.14
pkgrel=1
pkgdesc='A very simple utility for working with eCryptfs.'
arch=(i686 x86_64)
license=(GPL)
url="http://xyne.archlinux.ca/projects/ecryptfs-simple"
depends=(ecryptfs-utils util-linux)
makedepends=(cmake)
source=(
  http://xyne.archlinux.ca/projects/ecryptfs-simple/src/ecryptfs-simple-2016.11.14.tar.xz
  http://xyne.archlinux.ca/projects/ecryptfs-simple/src/ecryptfs-simple-2016.11.14.tar.xz.sig
)
sha512sums=(
  11c06040ea4c3deb8f478f4eb26b68a946da3d873d711e5a3e1582eb36f3fe63f19c3dc73fb610afb107c1068fe1200e02d5be03974e9e958c4aab419dffa288
  67b1c07a111eb46af11295aaa6d36558d28e9120d21269ceb93d02c05a31da4b4ee545f93007421fe0ea6110aeb8b4963aab55d9ae4dab0fd4d1a17c77b2f71e
)
md5sums=(
  87aac7267c97c837daff266340d25853
  3a3b0a740d8d0f35f25a123591f20a9a
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
