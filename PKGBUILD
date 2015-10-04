# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Grigorii Horos <horosgrisa@gmail.com>

_pkgname=papirus-pack-kde
pkgbase=papirus-git
pkgname=('papirus-git' 'papirus-plasma-theme-git' 'papirus-icon-theme-git' 'papirus-color-scheme-git' 'papirus-gtk-theme-git' 'papirus-aurorae-theme-git'
         'papirus-konsole-colorscheme-git' 'papirus-yakuake-theme-git' 'bomi-skin-papirus-git' 'libreoffice-papirus-theme-git' 'papirus-kmail-theme-git')
pkgver=r220.3f97691
pkgrel=1
pkgdesc="Look-and-feel package for modified and adaptive Paper theme for KDE"
arch=('any')
url="https://github.com/varlesh/${_pkgname}"
license=('CCPL:by-sa')
options=('!strip')
depends=('plasma-desktop')
optdepends=('papirus-plasma-theme-git' 'papirus-icon-theme-git' 'papirus-color-scheme-git' 'papirus-gtk-theme-git' 'papirus-aurorae-theme-git'
            'papirus-konsole-colorscheme-git' 'papirus-yakuake-theme-git' 'bomi-skin-papirus-git' 'libreoffice-papirus-theme-git' 'papirus-kmail-theme-git')
conflicts=('papirus')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd ${srcdir}/${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_papirus-git() {
    install -d ${pkgdir}/usr/share/plasma/look-and-feel
    cp -r ${srcdir}/${_pkgname}/look-and-feel/* ${pkgdir}/usr/share/plasma/look-and-feel/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 

package_papirus-plasma-theme-git() {
    pkgdesc="Modified and adaptive Paper plasma theme for KDE"
    options=('!strip')
    optdepends=()
    conflicts=('papirus-plasma-theme')
    install -d ${pkgdir}/usr/share/plasma/desktoptheme
    cp -r ${srcdir}/${_pkgname}/plasma-themes/papirus* ${pkgdir}/usr/share/plasma/desktoptheme/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}

package_papirus-icon-theme-git() {
    pkgdesc="Modified and adaptive Paper icon theme for KDE"
    options=('!strip')
    optdepends=()
    conflicts=('papirus-icon-theme')
    install -d ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/${_pkgname}/icons/papirus* ${pkgdir}/usr/share/icons/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}

package_papirus-color-scheme-git() {
    pkgdesc="Modified and adaptive Paper color scheme for KDE"
    options=('!strip')
    optdepends=()
    conflicts=('papirus-color-scheme')
    install -d ${pkgdir}/usr/share/color-schemes
    cp -r ${srcdir}/${_pkgname}/color-schemes/Papirus* ${pkgdir}/usr/share/color-schemes/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}

package_papirus-gtk-theme-git() {
    pkgdesc="Modified and adaptive Paper GTK theme for KDE"
    options=('!strip')
    depends=('gtk-engine-murrine' 'gtk2' 'gtk3')
    optdepends=()
    conflicts=('papirus-gtk-theme')
    install -d ${pkgdir}/usr/share/themes
    cp -r ${srcdir}/${_pkgname}/gtk-themes/papirus* ${pkgdir}/usr/share/themes/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}

package_papirus-aurorae-theme-git() {
    pkgdesc="Modified and adaptive Paper decorations for Kwin"
    options=('!strip')
    depends=('kwin')
    optdepends=()
    conflicts=('papirus-aurorae-theme')
    install -d ${pkgdir}/usr/share/aurorae/themes
    cp -r ${srcdir}/${_pkgname}/aurorae-themes/Papirus* ${pkgdir}/usr/share/aurorae/themes/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}

package_papirus-konsole-colorscheme-git() {
    pkgdesc="Modified and adaptive Paper colorscheme for Konsole"
    options=('!strip')
    depends=('konsole')
    optdepends=()
    conflicts=('papirus-konsole-colorscheme')
    install -d ${pkgdir}/usr/share/apps/konsole
    install -d ${pkgdir}/usr/share/konsole
    cp -r ${srcdir}/${_pkgname}/konsole-colorschemes/Papirus*.colorscheme ${pkgdir}/usr/share/apps/konsole/
    cp -r ${srcdir}/${_pkgname}/konsole-colorschemes/Papirus*.colorscheme ${pkgdir}/usr/share/konsole/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}

package_papirus-yakuake-theme-git() {
    pkgdesc="Modified and adaptive Paper theme for Yakuake"
    options=('!strip')
    depends=('yakuake')
    optdepends=()
    conflicts=('papirus-yakuake-theme' 'yakuake-skin-papirus' 'yakuake-skin-papirus-dark' 'yakuake-skin-papirus-dark-frameworks' 'yakuake-skin-papirus-frameworks')
    install -d ${pkgdir}/usr/share/apps/yakuake/skins
    install -d ${pkgdir}/usr/share/yakuake/skins
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
    conflicts=('bomi-skin-papirus')
    install -d ${pkgdir}/usr/share/bomi/skins
    cp -r ${srcdir}/${_pkgname}/bomi-skin/Papirus ${pkgdir}/usr/share/bomi/skins/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}

package_libreoffice-papirus-theme-git() {
    pkgdesc="Libreoffice Papirus theme"
    options=('!strip')
    depends=()
    optdepends=('libreoffice' 'libreoffice-fresh-rpm')
    conflicts=('libreoffice-papirus-theme' 'libreoffice-fresh-rpm-papirus-theme')
    install -d ${pkgdir}/usr/lib/libreoffice/share/config
    install -d ${pkgdir}/opt/libreoffice5.0/share/config        
    cp -r ${srcdir}/${_pkgname}/libreoffice-icons/images_papirus.zip ${pkgdir}/usr/lib/libreoffice/share/config/
    cp -r ${srcdir}/${_pkgname}/libreoffice-icons/images_papirus.zip ${pkgdir}/opt/libreoffice5.0/share/config/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}

package_papirus-kmail-theme-git() {
    pkgdesc="Modified and adaptive Paper theme for Kmail"
    options=('!strip')
    depends=('kmail')
    optdepends=()
    install -d ${pkgdir}/usr/share/messageviewer/themes
    cp -r ${srcdir}/${_pkgname}/kmail-theme/papirus* ${pkgdir}/usr/share/messageviewer/themes/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}