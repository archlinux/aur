# Maintainer: Vivien Maisonneuve <v dot maisonneuve at gmail dot com>
pkgname='colorlatex-git'
pkgver=r42.13cc291
pkgrel=1
pkgdesc='A script to colorize the terminal output of LaTeX compilers'
arch=('any')
url='https://gitlab.com/vivien_m/colorlatex'
license=('MIT')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
depends=('perl' 'texlive-bin')
makedepends=('git')
source=("$pkgname::git+https://gitlab.com/vivien_m/colorlatex.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" prefix=/usr install
}
