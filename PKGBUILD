arch=(any)
conflicts=(sph-dg)
depends=(liblmdb)
license=(gpl3+)
makedepends=(git gcc sph-sc)
md5sums=(SKIP)
pkgdesc='key/value/relations/graph database as a shared library'
pkgname=sph-dg-git
_gitname=sph-dg
pkgrel=1
pkgver=25
provides=(sph-dg)
source=("$pkgname::git://git.sph.mn/sph-dg#branch=stable")
url="http://sph.mn/content/2faf"

pkgver() {
  cd "$pkgname"
  git rev-list --count HEAD
}

package() {
  cd $pkgname
  ./exe/compile && ./exe/install --prefix="${pkgdir}"
}