# Maintainer: Sašo Živanović <saso.zivanovic@guest.arnes.si>
pkgname=python-collections-extended-git
pkgver=0.7.0.r3.g1f87c58
pkgrel=1
pkgdesc="Python container datatypes: bag, setlist, bijection, RangeMap"
arch=(any)
url="http://collections-extended.lenzm.net"
license=('APACHE')
depends=('python')
makedepends=(git)
options=(!emptydirs)
source=("$pkgname::git+https://github.com/mlenzen/collections-extended.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}



# vim:set ts=2 sw=2 et:
