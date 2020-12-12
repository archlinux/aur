# Maintainer: Howard Cheung <mail@h-cheung.cf>
pkgname=orchis-kde-theme-git
_gitname=Orchis-kde
pkgver=r5.018fd0f
pkgrel=2
pkgdesc="A materia Design theme for KDE Plasma desktop."
arch=('any')
url="https://github.com/vinceliuice/${_gitname}"
license=('GPL3')
optdepends=('plasma-desktop: for included plasma theme'
            'kvantum-qt5: for included kvantum theme'
            'sddm: for included sddm theme'
            'tela-circle-icon-theme-git: matching icon theme'
            'orchis-theme-git: matching gtk theme')
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
   mkdir -p "${pkgdir}/usr/share/plasma"
   mkdir -p "${pkgdir}/usr/share/Kvantum"
   mkdir -p "${pkgdir}/usr/share/sddm/themes"
   mkdir -p "${pkgdir}/usr/share/wallpapers"

   # aurorae theme
   cp -r "${srcdir}/${_gitname}/aurorae"/*/ "${pkgdir}/usr/share/aurorae/themes"
   # kvantum theme
   cp -r "${srcdir}/${_gitname}/Kvantum"/*/ "${pkgdir}/usr/share/Kvantum"
   # color scheme
   cp -r "${srcdir}/${_gitname}/color-schemes"/* "${pkgdir}/usr/share/color-schemes"
   # desktop theme
   cp -r "${srcdir}/${_gitname}/plasma"/*/ "${pkgdir}/usr/share/plasma"
   # look and feel
   cp -r "${srcdir}/${_gitname}/wallpaper/"*/ "${pkgdir}/usr/share/wallpapers"
   # sddm
   cp -r "${srcdir}/${_gitname}/sddm/"*/ "${pkgdir}/usr/share/sddm/themes"

}
