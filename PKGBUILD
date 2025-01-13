# Maintainer: RinLin_NYA <aur.cxneo@slmails.com>
# Contributor: Howard Cheung <mail@h-cheung.cf>
pkgname=plasma6-themes-orchis-kde-git
_gitname=Orchis-kde
pkgver=r66.036e831
pkgrel=2
pkgdesc="A material Design theme for KDE Plasma desktop."
arch=('any')
url="https://github.com/vinceliuice/${_gitname}"
license=('GPL-3.0-only')
optdepends=('plasma-desktop: For included plasma theme'
            'kvantum: For included kvantum theme'
            'kvantum-qt5: For included kvantum theme on qt5'
            'sddm: For included sddm theme'
            'tela-circle-icon-theme-git: Matching icon theme'
            'orchis-theme: Matching gtk theme')
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
