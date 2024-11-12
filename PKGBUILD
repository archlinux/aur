pkgname=sph-db-guile-git
pkgver=41.rae5f762
pkgrel=1
pkgdesc="guile bindings to sph-db"
arch=('any')
license=('GPL3')
url="https://github.com/sph-mn/sph-db-guile"
depends=('sph-db' 'guile')
makedepends=('git' 'gcc')
conflicts=('sph-db-guile')
provides=("sph-db-guile=$pkgver")
source=("git+https://github.com/sph-mn/sph-db-guile.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/sph-db-guile"
  printf "%s.r%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/sph-db-guile"
  export C_INCLUDE_PATH="/usr/include/guile/2.2/"
  ./exe/compile-c
}

package() {
  cd "${srcdir}/sph-db-guile"
  ./exe/install "${pkgdir}"
}
