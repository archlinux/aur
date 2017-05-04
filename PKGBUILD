arch=(any)
conflicts=(sph-dg-guile)
depends=(sph-dg "guile>=2")
license=(gpl3+)
makedepends=(git gcc sph-sc)
md5sums=(SKIP)
pkgdesc='guile bindings to sph-dg'
pkgname=sph-dg-guile-git
_gitname=sph-dg-guile
pkgrel=1
pkgver=74
provides=(sph-dg-guile)
source=("$pkgname::git://git.sph.mn/sph-dg-guile#branch=stable")
url="http://sph.mn/content/2faf"

pkgver() {
  cd "$pkgname"
  git rev-list --count HEAD
}

package() {
  cd $pkgname
  ./exe/compile && ./exe/install --prefix="${pkgdir}"
}