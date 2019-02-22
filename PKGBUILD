pkgname=sph-lib-git
pkgver=650
pkgrel=1
pkgdesc="more than 80 gpl3+ licensed guile scheme libraries"
arch=(any)
license=(gpl3+)
makedepends=(gcc git)
depends=(guile)
provides=(sph-lib)
conflicts=(sph-lib)
source=("git://git.sph.mn/sph-lib")
url="http://sph.mn/computer/software/sph-lib.html"
md5sums=(SKIP)

pkgver() {
  cd sph-lib
  git rev-list --count HEAD
}

build() {
  cd sph-lib
  export C_INCLUDE_PATH=/usr/include/guile/2.2/
  ./exe/compile-c
}

package() {
  cd sph-lib
  ./exe/install --prefix="${pkgdir}"
}