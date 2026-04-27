# Maintainer: Axium Ixane <AxiumIxane@protonmail.com>

pkgname=vinz-git
pkgver=r6.91ddcf8
pkgrel=1
pkgdesc="Interactive true-color procedural graphics engine for the terminal"
arch=('x86_64')
url="https://github.com/vinz-ux/VinZ"
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('git')
provides=('vinz')
conflicts=('vinz')
source=("git+https://github.com/vinz-ux/VinZ.git")
sha256sums=('SKIP')

pkgver() {
  cd "VinZ"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "VinZ"
  make CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS} -lm"
}

package() {
  cd "VinZ"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
