pkgname=sph-db-git
pkgver=128
pkgrel=1
pkgdesc="minimal nosql database for records and relations"
arch=(any)
license=(gpl3+)
makedepends=(git gcc)
depends=(lmdb)
provides=(sph-db)
source=("git://git.sph.mn/sph-db")
url="http://sph.mn"
md5sums=(SKIP)

pkgver() {
  cd sph-db
  git rev-list --count HEAD
}

package() {
  cd sph-db
  ./exe/compile-c
  ./exe/install "${pkgdir}"
}