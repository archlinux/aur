# Contributor: Eric Schulte

pkgname=cgum-git
_gitname=cgum
pkgver=8.5ce519f
pkgrel=1
pkgdesc="cgum"
url="https://github.com/GumTreeDiff/cgum"
arch=('i686' 'x86_64')
license=('lGPL')
depends=()
makedepends=('ocaml')
conflicts=('cgum')
replaces=('cgum')
source=('git://github.com/GumTreeDiff/cgum.git')
sha256sums=('SKIP')

pkgver() {
  cd ${_gitname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

# prepare() { }

build() {
  cd ${_gitname}
  make
}

package() {
  install -d "$pkgdir"/usr/share/bin
  install -Dm755 "$srcdir/$_gitname"/cgum "$pkgdir"/usr/bin/cgum
}

# vim: ts=2 sw=2 et:
