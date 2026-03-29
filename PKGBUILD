pkgname=sph-sc-git
_pkgname=sph-sc
pkgver=276
pkgrel=1
pkgdesc="compiles scheme-like s-expressions to c"
arch=(any)
url="https://github.com/sph-mn/sph-sc"
license=(GPL3)
depends=(guile)
makedepends=(git)
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_pkgname}::git+https://github.com/sph-mn/${_pkgname}.git")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/${_pkgname}"
  git rev-list --count HEAD
}

package() {
  cd "$srcdir/${_pkgname}"
  ./exe/install "$pkgdir"
}
