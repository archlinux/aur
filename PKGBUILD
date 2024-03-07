# Maintainer: Japorized <japorized (at) tuta (dot) io>

pkgname=sweet-folders-icons-git
_pkgname=Sweet-folders
pkgver=r14.b2192ff
pkgrel=1
arch=("any")
pkgdesc="Folder icons from the Sweet GTK Theme for Linux desktop environments"
url="https://github.com/EliverLara/${_pkgname}"
makedepends=('git')
license=('GPL')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p "${pkgdir}/usr/share/icons/"
  cp -R "${srcdir}/${_pkgname}/"* "${pkgdir}/usr/share/icons/"
}
