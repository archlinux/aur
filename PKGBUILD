_name=sph-dg
pkgname=$_name-git
pkgver=39
pkgrel=1
pkgdesc="key/value/relations/graph database as a shared library"
arch=(any)
license=(gpl3+)
makedepends=(git gcc)
depends=(liblmdb)
provides=($_name)
source=("git://git.sph.mn/$_name#branch=stable")
url="http://sph.mn/content/2faf"
md5sums=(SKIP)

pkgver() {
  cd "$_name"
  git rev-list --count HEAD
}

package() {
  cd "$_name" &&
  ./exe/compile-c &&
  ./exe/install "${pkgdir}"
}