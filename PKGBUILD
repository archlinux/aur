# Maintainer: Matyas Mehn <matyas.mehn at tum dot de>

_pkgname=CTB
pkgname=ctb-git
pkgver=20150618
pkgrel=1
pkgdesc="Circuit Toolbox for Matlab/Octave"
arch=("x86_64")
url="https://github.com/thliebig/$_pkgname"
license=("LGPL3")
makedepends=("make")
source=("git+https://github.com/thliebig/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

package() {
  cd "${srcdir}/${_pkgname}"
  make PREFIX=$pkgdir/usr install
}
