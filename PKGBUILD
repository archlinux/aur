# Maintainer: Thomas Gläßle <t_glaessle@gmx.de>
_pkgname=citip
pkgname=citip-git
pkgver=2020_07_23..6e46631
pkgrel=2
pkgdesc="Information Theoretic Inequality Prover (CLI)"
arch=('x86_64')
url="https://github.com/coldfix/Citip"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'glpk')
makedepends=('git')

provides=("$_pkgname")
source=("$_pkgname::git+https://github.com/coldfix/${_pkgname}")
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
