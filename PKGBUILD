# Maintainer: Jan Neumann <neum DOT ja AT gmail DOT com>

pkgname=qogir-kde-theme-git
_gitname=Qogir-kde
pkgver=r84.29bd033
pkgrel=1
pkgdesc="Qogir kde is a flat Design theme for KDE Plasma desktop"
arch=('any')
url="https://github.com/vinceliuice/Qogir-kde"
license=('GPL3')
depends=('plasma-desktop')
optdepends=('kvantum-qt5' 'qogir-gtk-theme-git' 'qogir-icon-theme-git' 'sddm') 
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
   cd ${_gitname}
    
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

package() {
   mkdir -p ${pkgdir}/usr/share/aurorae
   cp -r  ${srcdir}/${_gitname}/aurorae/themes/ ${pkgdir}/usr/share/aurorae
   
   mkdir -p ${pkgdir}/usr/share/color-schemes
   cp -r ${srcdir}/${_gitname}/color-schemes ${pkgdir}/usr/share

   mkdir -p ${pkgdir}/usr/share/plasma/layout-templates/
   cp -r ${srcdir}/${_gitname}/plasma/layout-templates ${pkgdir}/usr/share/plasma
   
   mkdir -p ${pkgdir}/usr/share/plasma/desktoptheme/
   cp -r ${srcdir}/${_gitname}/plasma/desktoptheme ${pkgdir}/usr/share/plasma
         
   mkdir -p ${pkgdir}/usr/share/plasma/look-and-feel/
   cp -r ${srcdir}/${_gitname}/plasma/look-and-feel/ ${pkgdir}/usr/share/plasma
    
   mkdir -p ${pkgdir}/usr/share/sddm/themes/Qogir
   cp -r ${srcdir}/${_gitname}/sddm/Qogir ${pkgdir}/usr/share/sddm/themes
   
   mkdir -p ${pkgdir}/usr/share/Kvantum/
   cp -r ${srcdir}/${_gitname}/Kvantum ${pkgdir}/usr/share
   
   mkdir -p ${pkgdir}/usr/share/wallpapers
   rm -r ${srcdir}/${_gitname}/wallpaper/src
   cp -r ${srcdir}/${_gitname}/wallpaper/* ${pkgdir}/usr/share/wallpapers
   
}
