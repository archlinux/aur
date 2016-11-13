#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=ecryptfs-simple
pkgver=2016.11.13.2
pkgrel=1
pkgdesc='A very simple utility for working with eCryptfs.'
arch=(i686 x86_64)
license=(GPL)
url="http://xyne.archlinux.ca/projects/ecryptfs-simple"
depends=(ecryptfs-utils util-linux)
makedepends=(cmake)
source=(
  http://xyne.archlinux.ca/projects/ecryptfs-simple/src/ecryptfs-simple-2016.11.13.2.tar.xz
  http://xyne.archlinux.ca/projects/ecryptfs-simple/src/ecryptfs-simple-2016.11.13.2.tar.xz.sig
)
sha512sums=(
  b82916e1ce527bf9afc1a1d97bd4923d729db47cbc98c0663f2230d450af0b680afcebd6726de3a9d76f2a78f6362e2d56db4bdab85712f18d079d2c94a057dc
  962bb2504db867d02ff7a2cba71bb7e9ae82602ee3b910df0d2f77747a68835690cff70757d218f94a995103fc73f62632e2af984c086dab8595c3f7ae05404d
)
md5sums=(
  6799cdc35d1f0aa86f7e6f0542a5282b
  587e986da51ae48e30c9ce51c5d0359a
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
