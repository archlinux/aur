pkgname=sph-sc-git
_pkgname=sph-sc
pkgver=260
pkgrel=1
pkgdesc="compiles scheme-like s-expressions to c"
arch=(any)
url="https://sph.mn/computer/software/sph-sc.html"
license=(GPL3)
depends=(guile sph-lib)
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
  echo "$pkgdir"
  ./exe/install --target-prefix="$pkgdir"
}
