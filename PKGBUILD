# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

_pkgname=dragon
pkgname=dragon-drag-and-drop-git
pkgver=1.0.0.r2.g6d21f90
pkgrel=1
pkgdesc='Simple drag-and-drop source/sink for X'
arch=('i686' 'x86_64')
url='https://github.com/mwh/dragon'
license=('GPL3')
depends=('gtk3')
makedepends=('git')
source=("$_pkgname::git+https://github.com/mwh/dragon")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  install -m755 -D dragon "$pkgdir/usr/bin/${pkgname%-git}"
}
