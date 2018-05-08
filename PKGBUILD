 
# Maintainer: Jan Neumann <neum DOT ja AT gmail DOT com>

 
 pkgname=nomad-gtk-themes-git
_gitname=nomad-gtk-themes
pkgver=r19.ddbae65
pkgrel=1
pkgdesc="Nomad GTK Themes"
arch=('any')
url="https://github.com/nomad-desktop/nomad-gtk-themes"
license=('GPL')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
   cd ${srcdir}/${_gitname}

   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   mkdir -p $pkgdir/usr/share/themes/Nomad
   mkdir -p $pkgdir/usr/share/themes/Nomad-Dark
   cp -r ${srcdir}/${_gitname}/themes/nomad ${pkgdir}/usr/share/themes/
   cp -r ${srcdir}/${_gitname}/themes/nomad-dark ${pkgdir}/usr/share/themes/
}
