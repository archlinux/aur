pkgname=sescript-git
_pkgname=sescript
pkgver=94
pkgrel=1
pkgdesc="compiles scheme-like s-expressions to ecmascript/javascript"
arch=(any)
url="https://github.com/sph-mn/${_pkgname}.git"
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
  ./exe/install "$pkgdir"
}
