# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Sergio Correia <sergio@correia.cc>
# Contributor: Nicolas Vivet <nizzox@gmail.com>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>

_pkgname=libphutil
pkgname="${_pkgname}-git"

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

pkgver=r1532.34b6895
pkgrel=1
pkgdesc='A collection of PHP utility classes'
arch=('any')
url="https://www.phacility.com/phabricator/"
license=('Apache')
depends=('php')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/phacility/libphutil.git")
sha256sums=('SKIP')

package() {
  install -d "$pkgdir/usr/share/php/$_pkgname"
  cp -a $_pkgname/* "$pkgdir/usr/share/php/$_pkgname/"
}
