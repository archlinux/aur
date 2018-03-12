# Maintainer: Jan Neumann <neum DOT ja AT gmail DOT com>

pkgname=numix-kde-theme-git
_gitname=numix-kde-theme
pkgver=r13.58d001f
pkgrel=1
pkgdesc="Numix pack for KDE Plasma5 - Git version"
arch=('any')
url="https://github.com/varlesh/numix-kde-theme"
license=('GPL3')
depends=('numix-circle-icon-theme-git')
optdepends=('numix-gtk-theme-git'
            'numix-cursor-theme-git') 
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
   cd ${_gitname}
    
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}
  


package() {
   mkdir -p ${pkgdir}/usr/share
   cp -r ${srcdir}/${_gitname}/color-schemes ${pkgdir}/usr/share/
   cp -r ${srcdir}/${_gitname}/plasma ${pkgdir}/usr/share/

}
