# Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>
pkgname=wlopm-git
pkgver=v0.1.0.r0.2430741
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
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make PREFIX='/usr' DESTDIR="$pkgdir"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make install PREFIX='/usr' DESTDIR="$pkgdir"
}
