 
# Maintainer: Jan Neumann <neum DOT ja AT gmail DOT com>

 
 pkgname=nx-gtk-themes-git
_gitname=nx-gtk-themes
pkgver=r28.53c3387
pkgrel=1
pkgdesc="NX GTK themes"
arch=('any')
url="https://github.com/nx-desktop/nx-gtk-themes"
license=('GPL')
replaces=('nomad-gtk-themes-git')
conflicts=('nomad-gtk-themes-git')
depends=('gtk3' 'gtk2' 'gtk-engine-murrine')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
   cd ${srcdir}/${_gitname}

   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   mkdir -p $pkgdir/usr/share/themes/nitrux
   mkdir -p $pkgdir/usr/share/themes/nitrux-dark
   cp -r ${srcdir}/${_gitname}/themes/nitrux ${pkgdir}/usr/share/themes/
   cp -r ${srcdir}/${_gitname}/themes/nitrux-dark ${pkgdir}/usr/share/themes/
}
