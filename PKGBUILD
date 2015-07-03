# Maintainer: Thomas Gläßle <t_glaessle@gmx.de>
_pkgname=citip
pkgname=citip-git
pkgver=2015_05_27..945a822
pkgrel=1
pkgdesc="Information Theoretic Inequality Prover (CLI)"
arch=('any')
url="https://github.com/coldfix/Citip"
license=('GPL3')
depends=('glpk' )
makedepends=('glpk' 'bison' 'flex')

provides=("$_pkgname")
source=("$_pkgname::git+git://github.com/coldfix/${_pkgname}")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git log -1 --format='%cd..%h' --date=short | tr - _
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"

  mkdir -p "$pkgdir/usr/bin"
  install -m755 Citip "$pkgdir/usr/bin"
}
