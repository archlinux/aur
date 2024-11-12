pkgname=sph-db-git
pkgver=140.r8fdf4b3
pkgrel=1
pkgdesc="minimal nosql database for records and relations"
arch=('any')
license=('GPL3')
depends=('lmdb')
makedepends=('git' 'gcc')
provides=("sph-db=$pkgver")
conflicts=('sph-db')
url="https://github.com/sph-mn/sph-db"
source=("git+https://github.com/sph-mn/sph-db.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/sph-db"
  printf "%s.r%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/sph-db"
  ./exe/compile-c
}

package() {
  cd "${srcdir}/sph-db"
  ./exe/install "${pkgdir}"
}
