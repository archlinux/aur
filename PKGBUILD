# Maintainer: Jan Neumann <neum DOT ja AT gmail DOT com>

pkgname=adapta-kde-git
gitname=adapta-kde
pkgver=20170917
pkgrel=2
pkgdesc="Complete Adapta theme pack for KDE Plasma using Kvantum theme engine (git version)"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/adapta-kde"
license=('GPL3')
depends=('kwin' 'plasma-desktop' 'kvantum-qt5-git')
optdepends=('papirus-icon-theme-git: Papirus icon theme with Adapta color set'
            'konsole: For the Konsole color scheme'
            'yakuake: For the Yakuake skin'
            'adapta-gtk-theme: Matching GTK theme')
makedepends=('git' 'make')
conflicts=('adapta-aurorae-theme-git')
source=("git+https://github.com/PapirusDevelopmentTeam/${gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${gitname}"

  git log -1 --format="%cd" --date=short | tr -d '-'
  
}


package() {

    mkdir -p ${pkgdir}/usr/share/aurorae/themes
    mkdir -p ${pkgdir}/usr/share/Kvantum/Adapta
    mkdir -p ${pkgdir}/usr/share/plasma/desktoptheme/Adapta
    mkdir -p ${pkgdir}/usr/share/plasma/look-and-feel/com.github.varlesh.adapta
    mkdir -p ${pkgdir}/usr/share/yakuake/skins/adapta
    mkdir -p ${pkgdir}/usr/share/color-schemes
    mkdir -p ${pkgdir}/usr/share/konsole 
    mkdir -p ${pkgdir}/usr/share/wallpapers/Adapta
 


    cp -r ${srcdir}/${gitname}/aurorae/themes/Adapta ${pkgdir}/usr/share/aurorae/themes
    cp -r ${srcdir}/${gitname}/Kvantum/Adapta ${pkgdir}/usr/share/Kvantum
    cp -r ${srcdir}/${gitname}/plasma/desktoptheme/Adapta ${pkgdir}/usr/share/plasma/desktoptheme
    cp -r ${srcdir}/${gitname}/yakuake/skins/adapta ${pkgdir}/usr/share/yakuake/skins
    cp -r ${srcdir}/${gitname}/color-schemes/Adapta.colors ${pkgdir}/usr/share/color-schemes
    cp -r ${srcdir}/${gitname}/konsole/Adapta.colorscheme ${pkgdir}/usr/share/konsole
    cp -r ${srcdir}/${gitname}/wallpapers/Adapta ${pkgdir}/usr/share/wallpapers/
    cp -r ${srcdir}/${gitname}/plasma/look-and-feel/com.github.varlesh.adapta ${pkgdir}/usr/share/plasma/look-and-feel/
}
