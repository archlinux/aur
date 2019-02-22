pkgname=sph-db-guile-git
arch=(any)
conflicts=(sph-db-guile)
depends=(sph-db guile)
license=(gpl3+)
makedepends=(git gcc)
md5sums=(SKIP)
pkgdesc="guile bindings to sph-db"
pkgrel=1
pkgver=36
provides=(sph-db-guile)
source=("git://git.sph.mn/sph-db-guile")
url="http://sph.mn"

pkgver() {
  cd sph-db-guile
  git rev-list --count HEAD
}

build() {
  cd sph-db-guile
  export C_INCLUDE_PATH=/usr/include/guile/2.2/
 ./exe/compile-c
}

package() {
  cd sph-db-guile
  ./exe/install "${pkgdir}"
}