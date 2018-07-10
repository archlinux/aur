# Maintainer: Salamandar <felix at piedallu dot me>
# Contributer: Michele Mocciola <mickele>

pkgname='freecad-assembly2'
pkgver=r223.766ed37
pkgrel=1
pkgdesc="Assembly workbench for FreeCAD v0.15"
arch=('any')
license=('GPL3')
depends=('freecad>=0.15')

_gitname='FreeCAD_assembly2'
url="https://github.com/hamish2014/${_gitname}"
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  :
}

package() {
  cd "${pkgname}"
  install -d  "${pkgdir}/usr/lib/freecad/Mod/${_gitname}"
  cp -R ./*   "${pkgdir}/usr/lib/freecad/Mod/${_gitname}"
}
