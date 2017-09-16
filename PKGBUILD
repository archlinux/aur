# Maintainer: Jan Neumann <neum DOT ja AT gmail DOT com>

pkgname=adapta-kde-git
gitname=adapta-kde
pkgver=20170916
pkgrel=1
pkgdesc="Complete Adapta theme pack for KDE Plasma using Kvantum theme engine (git version)"
arch=('x86_64')
url="https://github.com/PapirusDevelopmentTeam/adapta-kde"
license=('GPL3')
depends=('kwin' 'plasma-desktop' 'kvantum-qt5-git')
optdepends=('papirus-icon-theme-git: Papirus icon theme with Adapta color set'
            'yakuake: This pack includes a Yakuake skin')
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
    cp -r ${srcdir}/${gitname}/aurorae/themes/Adapta ${pkgdir}/usr/share/aurorae/themes
    
    mkdir -p ${pkgdir}/usr/share/Kvantum/Adapta
    cp -r ${srcdir}/${gitname}/Kvantum/Adapta ${pkgdir}/usr/share/Kvantum
         
    mkdir -p ${pkgdir}/usr/share/plasma/desktoptheme/Adapta
    cp -r  ${srcdir}/${gitname}/plasma/desktoptheme/Adapta ${pkgdir}/usr/share/plasma/desktoptheme
    
    mkdir -p ${pkgdir}/usr/share/yakuake/skins/adapta
    cp -r  ${srcdir}/${gitname}/yakuake/skins/adapta ${pkgdir}/usr/share/yakuake/skins
    
    mkdir -p ${pkgdir}/usr/share/color-schemes
    cp -r  ${srcdir}/${gitname}/color-schemes/Adapta.colors ${pkgdir}/usr/share/color-schemes
    
    
}
