# Maintainer: Kyle <kyle@free2.ml>
pkgname=kies-git
_gitname=Kies
pkgver=0.0 # determined from git origin
pkgrel=1
pkgdesc="the menu system for creation of a text-only desktop type environment, git version"
arch=('any')
url="https://github.com/f123/Kies"
license=('GPL3')
depends=('lynx')
optdepends=()
makedepends=('git')
provides=()
conflicts=()
install=$pkgname.install
source=('git+https://github.com/f123/Kies.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed -e 's|v||' -e 's|-|.|g'
}

package() {
  cd $_gitname
  ./install.sh --prefix=/usr --destdir="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
