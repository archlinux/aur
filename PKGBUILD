# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

_pkgname=dragon
pkgname=dragon-drag-and-drop-git
pkgver=1.1.0.r0.gf7f2121
pkgrel=1
pkgdesc='Simple drag-and-drop source/sink for X'
arch=('i686' 'x86_64')
url='https://github.com/mwh/dragon'
license=('GPL3')
depends=('gtk3')
makedepends=('git')
provides=('dragon-drag-and-drop')
conflicts=('dragon-drag-and-drop')
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
