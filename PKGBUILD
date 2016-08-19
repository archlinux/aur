# Maintainer: Eugen Kuksa <eugenk@cs.uni-bremen.de>

pkgname=hets-lib
_libname=hets
pkgver=20141215.ecafeec
pkgrel=2

pkgdesc="Basic libraries and other examples for Hets"
url="https://github.com/spechub/Hets-lib"
license=('custom:hets-license')
provides=('hets-lib')
conflicts=('hets-lib')
arch=('any')
makedepends=('git')
_commit='ecafeecc94554392d70022a2d9e9fce1448298c8'
source=("${pkgname}::git+https://github.com/spechub/Hets-lib.git#commit=${_commit}")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

package() {
  install -d "$pkgdir/usr/lib/hets/$pkgname"
  cp -R "$srcdir/$pkgname" "$pkgdir/usr/lib/hets/"
}
# vim:syntax=sh
