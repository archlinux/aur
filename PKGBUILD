# Maintainer: Raafat Turki <raafat.turki@pm.me>

pkgname=umess-git
pkgver=0.1.r37.862cd64
pkgrel=1
pkgdesc="A simple X pop-up"
arch=('x86_64')
license=('MIT')
url="https://github.com/kompoth/micromess"
source=("${pkgname}::git+https://github.com/kompoth/micromess.git")
depends=('libx11' 'libxrandr' 'libxft')
makedepends=('make')
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ver="0.1"
  printf "%s.r%s.%s" "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX="$pkgdir/usr" install
}
