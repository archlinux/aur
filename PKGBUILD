arch=(any)
conflicts=(sph-dg)
depends=(guile sph-lib liblmdb)
license=(gpl3+)
makedepends=(git gcc sph-sc)
md5sums=(SKIP)
pkgdesc='generic graph database for guile'
pkgname=sph-dg-git
pkgrel=1
pkgver=41
provides=(sph-dg)
source=("$pkgname::git://git.sph.mn/sph-dg#branch=stable")
url="http://sph.mn/content/2faf"

pkgver() {
  cd $pkgname
  git rev-list --count HEAD
}

package() {
  cd $pkgname
  ./exe/compile && ./exe/install --prefix="${pkgdir}"
}