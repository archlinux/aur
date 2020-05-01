# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

# PKGBUILD script for laby upstream, git version
# Learn programming, playing with ants and spider webs ;-) https://sgimenez.github.io/laby/
_pkgname=laby
pkgname=$_pkgname-git
pkgver=r363.b29fda9
pkgrel=1
pkgdesc="Learn programming, playing with ants and spider webs"
arch=('i686' 'x86_64')
url="https://sgimenez.github.io/laby/"
license=('GPL3')
groups=()
depends=('lablgtk3')
makedepends=('ocamlbuild' 'ocaml-findlib')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/sgimenez/laby")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
}
