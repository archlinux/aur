pkgname=sph-web-publish-git
_pkgname=sph-web-publish
pkgver=52
pkgrel=1
pkgdesc="static site generator"
arch=(any)
url="https://sph.mn/computer/software/sph-web-publish.html"
license=(GPL3)
depends=(guile guile-commonmark sph-lib)
optdepends=(rsync graphicsmagick)
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
  ./exe/install "${pkgdir}"
}
