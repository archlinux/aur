# Contributor: K. Piche <kpiche <at> rogers <dot> com>
# Maintainer: Jenya Sovetkin <e.sovetkin <at> gmail <dot> com>
pkgname=ripmime
pkgver=1.4.0.10
pkgrel=3
arch=(any)
license=('BSD')
pkgdesc="Tool to extract the attached files out of a MIME package"
url="http://pldaniels.com/ripmime/"
source=(http://pldaniels.com/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('bb0844b0e73625ef79206d3fe620716e')
makedepends=('gcc6')

package() {
  export CC=/usr/bin/gcc-6
  cd $srcdir/$pkgname-$pkgver
  make || return 1
  mkdir -p $pkgdir/usr/bin $pkgdir/usr/man/man1
  make LOCATION=$pkgdir/usr install
}
