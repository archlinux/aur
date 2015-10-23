# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
_pkgname=libespm
pkgname=$_pkgname-git
pkgver=r207.fe6b7b8
pkgrel=1
pkgdesc='Library for reading and writing .esp and .esm plugin files.'
arch=('any')
url="https://github.com/WrinklyNinja/$_pkgname"
license=('GPL3')
depends=('boost-libs')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  git checkout-index -a --prefix="$pkgdir/usr/include/$_pkgname/"
}
