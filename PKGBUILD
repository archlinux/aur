# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>

_gitname=gsl
pkgname=microsoft-gsl-git
pkgver=r401.3819df6
pkgrel=2
pkgdesc="Microsoft's Guidelines Support Library (GSL)"
arch=('i686' 'x86_64')
url='https://github.com/Microsoft/GSL'
license=('MIT')

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
