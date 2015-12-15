# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Grigorii Horos <horosgrisa@gmail.com>

_pkgname=papirus-pack-kde
pkgbase=papirus-git
pkgname=('papirus-git' 'papirus-plasma-theme-git' 'papirus-icon-theme-git' 'papirus-color-scheme-git' 'papirus-gtk-theme-git' 'papirus-aurorae-theme-git'
         'papirus-konsole-colorscheme-git' 'papirus-yakuake-theme-git' 'bomi-skin-papirus-git' 'libreoffice-papirus-theme-git' 'papirus-kmail-theme-git')
pkgver=r364.16e37a6
pkgrel=1
pkgdesc="Look-and-feel package for modified and adaptive Paper theme for KDE"
arch=('any')
url="https://github.com/varlesh/${_pkgname}"
license=('CCPL:by-sa')
options=('!strip')
makedepends=('git')
depends=('plasma-desktop')
conflicts=('papirus')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd ${srcdir}/${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_papirus-git() {
    depends=('papirus-plasma-theme-git' 'papirus-icon-theme-git' 'papirus-color-scheme-git' 'papirus-gtk-theme-git' 'papirus-aurorae-theme-git'
             'papirus-konsole-colorscheme-git' 'papirus-yakuake-theme-git' 'libreoffice-papirus-theme-git')
    optdepends=('bomi-skin-papirus-git' 'papirus-kmail-theme-git')
    install -dm755 ${pkgdir}/usr/share/plasma/look-and-feel
    cp -r ${srcdir}/${_pkgname}/look-and-feel/* ${pkgdir}/usr/share/plasma/look-and-feel/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 

package_papirus-plasma-theme-git() {
    pkgdesc="Modified and adaptive Paper plasma theme for KDE"
    options=('!strip')
    optdepends=()
    makedepends=('git')
    conflicts=('plasma-theme-papirus')
    install -dm755 ${pkgdir}/usr/share/plasma/desktoptheme
    cp -r ${srcdir}/${_pkgname}/plasma-themes/papirus* ${pkgdir}/usr/share/plasma/desktoptheme/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}

package_papirus-icon-theme-git() {
    pkgdesc="Modified and adaptive Paper icon theme for KDE"
    options=('!strip')
    optdepends=()
    makedepends=('git')
    conflicts=('papirus-icon-theme')
    install -dm755 ${pkgdir}/usr/share/{icons,apps/amarok/icons/papirus{,-black-panel,-dark}}
    cp -r ${srcdir}/${_pkgname}/icons/papirus*                                  ${pkgdir}/usr/share/icons/
    cp -r ${srcdir}/${_pkgname}/icons/papirus/extra-icons/amarok/*              ${pkgdir}/usr/share/apps/amarok/icons/papirus/
    cp -r ${srcdir}/${_pkgname}/icons/papirus-black-panel/extra-icons/amarok/*  ${pkgdir}/usr/share/apps/amarok/icons/papirus-black-panel/
    cp -r ${srcdir}/${_pkgname}/icons/papirus-dark/extra-icons/amarok/*         ${pkgdir}/usr/share/apps/amarok/icons/papirus-dark/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}

package_papirus-color-scheme-git() {
    pkgdesc="Modified and adaptive Paper color scheme for KDE"
    options=('!strip')
    optdepends=()
    makedepends=('git')
    conflicts=('papirus-color-scheme')
    install -Dm644 -t "${pkgdir}/usr/share/color-schemes/"   ${srcdir}/${_pkgname}/color-schemes/*.colors
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}

package_papirus-gtk-theme-git() {
    pkgdesc="Modified and adaptive Paper GTK theme for KDE"
    options=('!strip')
    depends=('gtk-engine-murrine' 'gtk2' 'gtk3')
    optdepends=()
    makedepends=('git')
    conflicts=('papirus-gtk-theme')
    install -dm755 ${pkgdir}/usr/share/themes
    cp -r ${srcdir}/${_pkgname}/gtk-themes/papirus* ${pkgdir}/usr/share/themes/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}

package_papirus-aurorae-theme-git() {
    pkgdesc="Modified and adaptive Paper decorations for Kwin"
    options=('!strip')
    depends=('kwin')
    optdepends=()
    makedepends=('git')
    conflicts=('papirus-aurorae-theme')
    install -dm755 ${pkgdir}/usr/share/aurorae/themes
    cp -r ${srcdir}/${_pkgname}/aurorae-themes/Papirus* ${pkgdir}/usr/share/aurorae/themes/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}

package_papirus-konsole-colorscheme-git() {
    pkgdesc="Modified and adaptive Paper colorscheme for Konsole"
    options=('!strip')
    depends=('konsole')
    optdepends=()
    makedepends=('git')
    conflicts=('papirus-konsole-colorscheme')
    install -Dm644 -t "${pkgdir}/usr/share/apps/konsole/"   ${srcdir}/${_pkgname}/konsole-colorschemes/*.colorscheme
    install -Dm644 -t "${pkgdir}/usr/share/konsole/"        ${srcdir}/${_pkgname}/konsole-colorschemes/*.colorscheme
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}

package_papirus-yakuake-theme-git() {
    pkgdesc="Modified and adaptive Paper theme for Yakuake"
    options=('!strip')
    depends=()
    optdepends=('yakuake' 'yakuake-frameworks-git')
    makedepends=('git')
    conflicts=('papirus-yakuake-theme' 'yakuake-skin-papirus' 'yakuake-skin-papirus-dark' 'yakuake-skin-papirus-dark-frameworks' 'yakuake-skin-papirus-frameworks')
    install -dm755 ${pkgdir}/usr/share/{apps/yakuake/skins,yakuake/skins}
    cp -r ${srcdir}/${_pkgname}/yakuake-skins/papirus* ${pkgdir}/usr/share/apps/yakuake/skins/
    cp -r ${srcdir}/${_pkgname}/yakuake-skins/papirus* ${pkgdir}/usr/share/yakuake/skins/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}

package_bomi-skin-papirus-git() {
    pkgdesc="Papirus theme for Bomi"
    options=('!strip')
    depends=('bomi')
    optdepends=()
    makedepends=('git')
    conflicts=('bomi-skin-papirus')
    install -dm755 ${pkgdir}/usr/share/bomi/skins
    cp -r ${srcdir}/${_pkgname}/bomi-skin/Papirus ${pkgdir}/usr/share/bomi/skins/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}

package_libreoffice-papirus-theme-git() {
    pkgdesc="Libreoffice Papirus theme"
    options=('!strip')
    depends=()
    optdepends=('libreoffice' 'libreoffice-fresh-rpm')
    makedepends=('git')
    conflicts=('libreoffice-style-papirus' 'libreoffice-papirus-theme' 'libreoffice-fresh-rpm-papirus-theme')
    install -Dm644 -t "${pkgdir}/usr/lib/libreoffice/share/config/" ${srcdir}/${_pkgname}/libreoffice-icons/*.zip
    install -Dm644 -t "${pkgdir}/opt/libreoffice5.0/share/config/"  ${srcdir}/${_pkgname}/libreoffice-icons/*.zip
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
    find ${pkgdir}/opt -type f -exec chmod 644 {} \;
    find ${pkgdir}/opt -type d -exec chmod 755 {} \;
}

package_papirus-kmail-theme-git() {
    pkgdesc="Modified and adaptive Paper theme for Kmail"
    options=('!strip')
    depends=('kmail')
    optdepends=()
    makedepends=('git')
    conflicts=('papirus-kmail-theme')
    install -dm755 ${pkgdir}/usr/share/messageviewer/themes
    cp -r ${srcdir}/${_pkgname}/kmail-theme/papirus* ${pkgdir}/usr/share/messageviewer/themes/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}
