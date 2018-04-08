# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>

_gitname=gsl
pkgname=microsoft-gsl-git
pkgver=r487.d846fe5
pkgrel=1
pkgdesc="Microsoft's Guidelines Support Library (GSL)"
arch=('x86_64')
url='https://github.com/Microsoft/GSL'
license=('MIT')
provides=('microsoft-gsl')

source=("$_gitname::git+https://github.com/Microsoft/GSL.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"
  install -d "$pkgdir/usr/include"
  cp -r include "$pkgdir/usr"
}
