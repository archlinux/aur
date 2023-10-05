# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>
pkgname=whitesur-kde-theme-git
_themeName=WhiteSur
_gitname="$_themeName-kde"
pkgver=r113.9f66519
pkgrel=2
pkgdesc="MacOS big sur like theme for KDE Plasma"
arch=('any')
url="https://github.com/vinceliuice/${_gitname}"
license=('GPL3')
optdepends=('plasma-desktop: for included plasma theme' 'kvantum-qt5: for included kvantum theme' 'sddm: for included sddm theme' 'whitesur-icon-theme-git: matching icon theme' 'whitesur-cursor-theme-git: matching cursor theme' 'whitesur-gtk-theme-git: matching gtk theme' 'latte-dock: for included latte theme') 
makedepends=('git')
provides=('whitesur-kde-theme')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
   cd ${_gitname}
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   # make folders
   install -d "${pkgdir}/usr/share/aurorae/themes"
   # https://gist.github.com/RShirohara/83decd90c69fee0995e5046c8c875469
   cp -r "${srcdir}/${_gitname}/aurorae/normal"/* "${pkgdir}/usr/share/aurorae/themes"
   cp -r "${srcdir}/${_gitname}/aurorae/common/assets"/*.svg "${pkgdir}/usr/share/aurorae/themes/WhiteSur"
   cp -r "${srcdir}/${_gitname}/aurorae/common/assets"/*.svg "${pkgdir}/usr/share/aurorae/themes/WhiteSur_x1.25"
   cp -r "${srcdir}/${_gitname}/aurorae/common/assets"/*.svg "${pkgdir}/usr/share/aurorae/themes/WhiteSur_x1.5"
   cp -r "${srcdir}/${_gitname}/aurorae/common/assets"/*.svg "${pkgdir}/usr/share/aurorae/themes/WhiteSur_x1.75"
   cp -r "${srcdir}/${_gitname}/aurorae/common/assets-dark"/*.svg "${pkgdir}/usr/share/aurorae/themes/WhiteSur-dark"
   cp -r "${srcdir}/${_gitname}/aurorae/common/assets-dark"/*.svg "${pkgdir}/usr/share/aurorae/themes/WhiteSur-dark_x1.25"
   cp -r "${srcdir}/${_gitname}/aurorae/common/assets-dark"/*.svg "${pkgdir}/usr/share/aurorae/themes/WhiteSur-dark_x1.5"
   cp -r "${srcdir}/${_gitname}/aurorae/common/assets-dark"/*.svg "${pkgdir}/usr/share/aurorae/themes/WhiteSur-dark_x1.75"
   cp -r "${srcdir}/${_gitname}/aurorae/sharp"/* "${pkgdir}/usr/share/aurorae/themes"
   cp -r "${srcdir}/${_gitname}/aurorae/common/assets"/*.svg "${pkgdir}/usr/share/aurorae/themes/WhiteSur-sharp"
   cp -r "${srcdir}/${_gitname}/aurorae/common/assets"/*.svg "${pkgdir}/usr/share/aurorae/themes/WhiteSur-sharp_x1.25"
   cp -r "${srcdir}/${_gitname}/aurorae/common/assets"/*.svg "${pkgdir}/usr/share/aurorae/themes/WhiteSur-sharp_x1.5"
   cp -r "${srcdir}/${_gitname}/aurorae/common/assets"/*.svg "${pkgdir}/usr/share/aurorae/themes/WhiteSur-sharp_x1.75"
   cp -r "${srcdir}/${_gitname}/aurorae/common/assets-dark"/*.svg "${pkgdir}/usr/share/aurorae/themes/WhiteSur-dark-sharp"
   cp -r "${srcdir}/${_gitname}/aurorae/common/assets-dark"/*.svg "${pkgdir}/usr/share/aurorae/themes/WhiteSur-dark-sharp_x1.25"
   cp -r "${srcdir}/${_gitname}/aurorae/common/assets-dark"/*.svg "${pkgdir}/usr/share/aurorae/themes/WhiteSur-dark-sharp_x1.5"
   cp -r "${srcdir}/${_gitname}/aurorae/common/assets-dark"/*.svg "${pkgdir}/usr/share/aurorae/themes/WhiteSur-dark-sharp_x1.75"
   cp -r "${srcdir}/${_gitname}/aurorae/opaque"/* "${pkgdir}/usr/share/aurorae/themes"
   cp -r "${srcdir}/${_gitname}/aurorae/common/assets"/*.svg "${pkgdir}/usr/share/aurorae/themes/WhiteSur-opaque"
   cp -r "${srcdir}/${_gitname}/aurorae/common/assets"/*.svg "${pkgdir}/usr/share/aurorae/themes/WhiteSur-opaque_x1.25"
   cp -r "${srcdir}/${_gitname}/aurorae/common/assets"/*.svg "${pkgdir}/usr/share/aurorae/themes/WhiteSur-opaque_x1.5"
   cp -r "${srcdir}/${_gitname}/aurorae/common/assets"/*.svg "${pkgdir}/usr/share/aurorae/themes/WhiteSur-opaque_x1.75"
   cp -r "${srcdir}/${_gitname}/aurorae/common/assets-dark"/*.svg "${pkgdir}/usr/share/aurorae/themes/WhiteSur-dark-opaque"
   cp -r "${srcdir}/${_gitname}/aurorae/common/assets-dark"/*.svg "${pkgdir}/usr/share/aurorae/themes/WhiteSur-dark-opaque_x1.25"
   cp -r "${srcdir}/${_gitname}/aurorae/common/assets-dark"/*.svg "${pkgdir}/usr/share/aurorae/themes/WhiteSur-dark-opaque_x1.5"
   cp -r "${srcdir}/${_gitname}/aurorae/common/assets-dark"/*.svg "${pkgdir}/usr/share/aurorae/themes/WhiteSur-dark-opaque_x1.75"

   install -d "${pkgdir}/usr/share/color-schemes"
   install -d "${pkgdir}/usr/share/plasma/desktoptheme"
   install -d "${pkgdir}/usr/share/plasma/look-and-feel"
   install -d "${pkgdir}/usr/share/Kvantum"
   install -d "${pkgdir}/usr/share/sddm/themes"
   install -d "${pkgdir}/usr/share/wallpapers"
   
   # aurorae theme
   cp -r "${srcdir}/${_gitname}/aurorae"/* "${pkgdir}/usr/share/aurorae/themes"
   # kvantum theme
   cp -r "${srcdir}/${_gitname}/Kvantum"/* "${pkgdir}/usr/share/Kvantum"
   # color scheme
   cp -r "${srcdir}/${_gitname}/color-schemes"/* "${pkgdir}/usr/share/color-schemes"
   # desktop theme
   cp -r "${srcdir}/${_gitname}/plasma/desktoptheme"/${_themeName}* "${pkgdir}/usr/share/plasma/desktoptheme"
   cp -r "${srcdir}/${_gitname}/plasma/desktoptheme/icons" "${pkgdir}/usr/share/plasma/desktoptheme/${_themeName}"
   cp -r "${srcdir}/${_gitname}/plasma/desktoptheme/icons" "${pkgdir}/usr/share/plasma/desktoptheme/${_themeName}-alt"
   cp -r "${srcdir}/${_gitname}/plasma/desktoptheme/icons" "${pkgdir}/usr/share/plasma/desktoptheme/${_themeName}-dark"
   # look and feel
   cp -r "${srcdir}/${_gitname}/plasma/look-and-feel"/* "${pkgdir}/usr/share/plasma/look-and-feel"
   # wallpaper
   cp -r "${srcdir}/${_gitname}/wallpaper"/* "${pkgdir}/usr/share/wallpapers"
   # sddm
   cp -r "${srcdir}/${_gitname}/sddm/${_themeName}" "${pkgdir}/usr/share/sddm/themes"
   
   # latte
   install -d "$HOME/.config/latte"
   cp -r "${srcdir}/${_gitname}/latte-dock"/* "$HOME/.config/latte"
   printf "%b" "\e[1;33m==> WARNING: \e[0mThe package installed a latte-dock theme which is not deleted on removal. (Located in $HOME/.config/latte)\n"

} 
