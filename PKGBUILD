# Maintainer: Quint Guvernator <quint@guvernator.net>

pkgname="creddit-git"
pkgver=r177.accd51f
pkgrel=1
pkgdesc='CLI Reddit client written in C.'
arch=('x86_64' 'i686')
url='https://github.com/Cotix/cReddit'
license=('MIT')
depends=('ncurses' 'curl')
makedepends=('git' 'make' 'gcc')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname::git+http://github.com/Cotix/cReddit.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make PREFIX="$pkgdir/usr/" install
}
