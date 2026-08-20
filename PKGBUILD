pkgname=hell-git
_pkgname=hell
pkgdesc="hell: kill autotools"
pkgver=r77.e36ad42
pkgrel=1
arch=('x86_64')
url="https://codeberg.org/shrub900/hell"
license=('ISC')
depends=()
makedepends=('git')
source=(git+$url.git)
sha512sums=('SKIP')
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname" 
  make DESTDIR="${pkgdir}" install
}
