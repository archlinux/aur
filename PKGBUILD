# Contributor: Lucas de Sena <lucas DOT ta23 @ gmail DOT com>
# Contributor: Shizeeg Unadequatov <shizeeque @ gmail DOT com>
# Contributor: Alexandre Dantas <eu @ alexdantas DOT net>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=yetris-git
pkgver=20150103
pkgrel=1
pkgdesc='Customizable Tetris(tm) for the terminal.'
arch=('x86_64' 'i686')
url="http://www.github.com/alexdantas/yetris/"
license=('GPL3')
depends=('ncurses')
makedepends=('git')
conflicts=("${pkgname%-*}")
source=("$pkgname::git+https://github.com/alexdantas/yetris")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git log -1 --date=short | grep 'Date:' | sed 's|[^0-9]||g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

