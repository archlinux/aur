# Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>
pkgname=wlopm-git
pkgver=r15.4ffa093
pkgrel=1
pkgdesc="Wayland output power management."
arch=('x86_64')
url="https://git.sr.ht/~leon_plickat/wlopm"
license=('GPL3')
depends=(wayland{,-protocols})
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://git.sr.ht/~leon_plickat/wlopm')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make PREFIX='/usr' DESTDIR="$pkgdir"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make install PREFIX='/usr' DESTDIR="$pkgdir"
}
