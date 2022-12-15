# Maintainer: Sainnhe Park <sainnhe@gmail.com>
# Maintainer: Anupam Srivastava <anupam@dont.tech>
pkgname=fluent-kde-theme-git
_themeName=Fluent
_gitname="$_themeName-kde"
pkgver=r86.ba5605b
pkgrel=1
pkgdesc="Fluent design theme for kde plasma"
arch=('any')
url="https://github.com/vinceliuice/${_gitname}"
license=('GPL3')
optdepends=('plasma-desktop: for included plasma theme' 'kvantum-qt5: for included kvantum theme' 'sddm: for included sddm theme' 'fluent-icon-theme-git: matching icon theme' 'fluent-cursor-theme-git: matching cursor theme' 'fluent-gtk-theme-git: matching gtk theme') 
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
   cd ${_gitname}
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   # make folders
   mkdir -p "${pkgdir}/usr/share/aurorae/themes"
   mkdir -p "${pkgdir}/usr/share/color-schemes"
   mkdir -p "${pkgdir}/usr/share/plasma/desktoptheme"
   mkdir -p "${pkgdir}/usr/share/plasma/look-and-feel"
   mkdir -p "${pkgdir}/usr/share/Kvantum"
   mkdir -p "${pkgdir}/usr/share/sddm/themes"
   mkdir -p "${pkgdir}/usr/share/wallpapers"

   # aurorae theme
   cp -r "${srcdir}/${_gitname}/aurorae"/* "${pkgdir}/usr/share/aurorae/themes"
   # kvantum theme
   cp -r "${srcdir}/${_gitname}/Kvantum"/* "${pkgdir}/usr/share/Kvantum"
   # color scheme
   cp -r "${srcdir}/${_gitname}/color-schemes"/* "${pkgdir}/usr/share/color-schemes"
   # desktop theme
   cp -r "${srcdir}/${_gitname}/plasma/desktoptheme"/${_themeName}* "${pkgdir}/usr/share/plasma/desktoptheme"
   # look and feel
   cp -r "${srcdir}/${_gitname}/plasma/look-and-feel"/* "${pkgdir}/usr/share/plasma/look-and-feel"
   # wallpaper
   cp -r "${srcdir}/${_gitname}/wallpaper/${_themeName}" "${pkgdir}/usr/share/wallpapers"
   # sddm
   cp -r "${srcdir}/${_gitname}/sddm/${_themeName}" "${pkgdir}/usr/share/sddm/themes"
} 
