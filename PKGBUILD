pkgname=sph-web-app-git
_pkgname=sph-web-app
pkgver=149
pkgrel=1
pkgdesc="guile scheme framework for dynamic websites"
arch=(any)
url="https://sph.mn/computer/software/sph-web-app.html"
license=(GPL3)
depends=(guile sph-lib)
makedepends=(git)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/sph-mn/${_pkgname}.git")
sha256sums=(SKIP)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git rev-list --count HEAD
}

package() {
  cd "${srcdir}/${_pkgname}"
  ./exe/install --target-prefix="${pkgdir}"
}
