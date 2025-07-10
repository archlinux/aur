# Maintainer: Texas0295 <texas0295@outlook.com>

pkgname=evap-git
pkgver=r1.abcdefg
pkgrel=1
pkgdesc="Ephemeral editing buffer with zero residue (git version)"
arch=('x86_64')
url="https://github.com/Texas0295/evap"
license=('MIT')
depends=()
makedepends=('git' 'make' 'gcc')
provides=('evap')
conflicts=('evap')
source=("git+https://github.com/Texas0295/evap.git")
md5sums=('SKIP')
options=('!strip' '!debug')

pkgver() {
  cd "$srcdir/evap"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/evap"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/evap"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
