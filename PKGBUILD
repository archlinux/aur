# Maintainer: Gulshan Singh <gsingh2011@gmail.com>
pkgname=archutil
pkgver=r47.e9b0dd2
pkgrel=1
pkgdesc="A tool for listing and backing up explicitly installed packages and for managing config files"
arch=('i686' 'x86_64')
url="https://github.com/gsingh93/archutil"
license=('MIT')
makedepends=('git')
depends=('python2')
source=('git+https://github.com/gsingh93/archutil')
md5sums=('SKIP')

_gitname="archutil"

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  python setup.py sdist
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir/" --optimize=1
}
