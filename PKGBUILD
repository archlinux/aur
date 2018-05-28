 
# Maintainer: Jan Neumann <neum DOT ja AT gmail DOT com>

 
 pkgname=sddm-elegant-theme-git
_gitname=Elegant-sddm
pkgver=r34.732499b
pkgrel=1
pkgdesc="Elegant sddm theme"
arch=('any')
url="https://github.com/surajmandalcell/Elegant-sddm"
license=('GPL')
depends=('sddm')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
   cd ${srcdir}/${_gitname}

   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   cd ${srcdir}/${_gitname}
   mkdir -p ${pkgdir}/usr/share/sddm/themes/
   cp -r Elegant ${pkgdir}/usr/share/sddm/themes/
}
