# Maintainer: Nico <d3sox at protonmail dot com>


pkgname=arch-kde-theme-git
_themeName=Arch
_gitname=Arch
pkgver=r18.e75195b
pkgrel=1
pkgdesc="Elegant theme for KDE Plasma with dark and light mode"
arch=('any')
url="https://github.com/rkstrdee7/${_gitname}"
license=('GPL3')
optdepends=('plasma-desktop: for included plasma theme' 'kvantum')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
   cd ${_gitname}
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   # make folders
#   mkdir -p "${pkgdir}/usr/share/aurorae/themes"
   mkdir -p "${pkgdir}/usr/share/color-schemes"
   mkdir -p "${pkgdir}/usr/share/plasma/desktoptheme"
   mkdir -p "${pkgdir}/usr/share/plasma/look-and-feel"
   mkdir -p "${pkgdir}/usr/share/Kvantum"
#   mkdir -p "${pkgdir}/usr/share/sddm/themes"
   mkdir -p "${pkgdir}/usr/share/wallpapers"

   # aurorae theme
#   cp -r "${srcdir}/${_gitname}/aurorae"/* "${pkgdir}/usr/share/aurorae/themes"
   # kvantum theme
   cp -r "${srcdir}/${_gitname}/Kvantum"/* "${pkgdir}/usr/share/Kvantum"
   # color scheme
   cp -r "${srcdir}/${_gitname}/color-schemes"/* "${pkgdir}/usr/share/color-schemes"
   # desktop theme
   cp -r "${srcdir}/${_gitname}/plasma/desktoptheme"/${_themeName}* "${pkgdir}/usr/share/plasma/desktoptheme"
#   cp -r "${srcdir}/${_gitname}/plasma/desktoptheme/icons" "${pkgdir}/usr/share/plasma/desktoptheme/${_themeName}"
#   cp -r "${srcdir}/${_gitname}/plasma/desktoptheme/icons" "${pkgdir}/usr/share/plasma/desktoptheme/${_themeName}-alt"
#   cp -r "${srcdir}/${_gitname}/plasma/desktoptheme/icons" "${pkgdir}/usr/share/plasma/desktoptheme/${_themeName}-dark"
   # look and feel
   cp -r "${srcdir}/${_gitname}/plasma/look-and-feel"/* "${pkgdir}/usr/share/plasma/look-and-feel"
   # wallpaper
   cp -r "${srcdir}/${_gitname}/wallpapers"/*  "${pkgdir}/usr/share/wallpapers"
#   # sddm
#   cp -r "${srcdir}/${_gitname}/sddm/${_themeName}" "${pkgdir}/usr/share/sddm/themes"

   # latte
#   mkdir -p "$HOME/.config/latte"
#   cp -r "${srcdir}/${_gitname}/latte-dock"/* "$HOME/.config/latte"
#   printf "%b" "\e[1;33m==> WARNING: \e[0mThe package installed a latte-dock theme which is not deleted on removal. (Located in $HOME/.config/latte)\n"

}
