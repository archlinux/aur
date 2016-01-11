# Maintainer: Jon Gjengset <jon@thesquareplanet.com>
pkgname=cpubars-git
pkgver=r29.49f5ff0
pkgrel=1
pkgdesc="lightweight terminal-based multicore CPU usage monitor"
arch=('any')
url="https://github.com/aclements/cpubars"
license=('MIT')
depends=('ncurses')
makedepends=('git')
source=("${pkgname}::git+https://github.com/aclements/cpubars.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make cpubars
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$srcdir/$pkgname/cpubars" "$pkgdir/usr/bin/cpubars"
}

# vim:set ts=2 sw=2 et:
