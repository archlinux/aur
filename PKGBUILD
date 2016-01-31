# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Grigorii Horos <horosgrisa@gmail.com>

_pkgname=papirus-pack-kde
pkgbase=papirus-git
pkgname=('papirus-git' 'papirus-plasma-theme-git' 'papirus-icon-theme-git' 'papirus-color-scheme-git' 'papirus-gtk-theme-git' 'papirus-aurorae-theme-git' 'papirus-qtcurve-theme-git'
         'papirus-konsole-colorscheme-git' 'papirus-yakuake-theme-git' 'bomi-skin-papirus-git' 'libreoffice-papirus-theme-git' 'papirus-kmail-theme-git' 'papirus-vlc-theme-git' 
         'papirus-k3b-theme-git' 'papirus-smplayer-theme-git')
pkgver=r453.4aed3b4
pkgrel=1
pkgdesc="Look-and-feel package for modified and adaptive Paper theme for KDE"
arch=('any')
url="https://github.com/varlesh/${_pkgname}"
license=('CCPL:by-sa')
options=()
makedepends=('git')
depends=('plasma-desktop')
conflicts=('papirus')
install=()
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd ${srcdir}/${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_papirus-git() {
    depends=('papirus-plasma-theme-git' 
             'papirus-icon-theme-git' 
             'papirus-color-scheme-git' 
             'papirus-gtk-theme-git' 
             'papirus-aurorae-theme-git' 
             'papirus-qtcurve-theme-git' 
             'papirus-konsole-colorscheme-git')
    optdepends=("papirus-yakuake-theme-git: Papirus theme for Yakuake" 
                "bomi-skin-papirus-git: Papirus theme for Bomi" 
                "libreoffice-papirus-theme-git: Papirus theme for LibreOffice" 
                "papirus-kmail-theme-git: Papirus theme for KMail" 
                "papirus-vlc-theme-git: Papirus theme for VLC Media Player" 
                "papirus-k3b-theme-git: Papirus theme for K3B" 
                "papirus-smplayer-theme-git: Papirus theme for SMPlayer")
    install -dm755 ${pkgdir}/usr/share/plasma/look-and-feel
    cp -r ${srcdir}/${_pkgname}/look-and-feel/* ${pkgdir}/usr/share/plasma/look-and-feel/
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
} 

package_papirus-plasma-theme-git() {
    pkgdesc="Modified and adaptive Paper plasma theme for KDE"
    options=()
    optdepends=()
    conflicts=('plasma-theme-papirus')
    install -dm755 ${pkgdir}/usr/share/plasma/desktoptheme
    cp -r ${srcdir}/${_pkgname}/plasma-themes/papirus* ${pkgdir}/usr/share/plasma/desktoptheme/
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

package_papirus-icon-theme-git() {
    pkgdesc="Modified and adaptive Paper icon theme for KDE"
    options=('!strip')
    optdepends=()
    conflicts=('papirus-icon-theme')
    install -dm755 ${pkgdir}/usr/share/{icons,apps/amarok/icons/papirus{,-black-panel,-dark}}
    cp -r ${srcdir}/${_pkgname}/icons/papirus*                                  ${pkgdir}/usr/share/icons/
    cp -r ${srcdir}/${_pkgname}/icons/papirus/extra-icons/amarok/*              ${pkgdir}/usr/share/apps/amarok/icons/papirus/
    cp -r ${srcdir}/${_pkgname}/icons/papirus-black-panel/extra-icons/amarok/*  ${pkgdir}/usr/share/apps/amarok/icons/papirus-black-panel/
    cp -r ${srcdir}/${_pkgname}/icons/papirus-dark/extra-icons/amarok/*         ${pkgdir}/usr/share/apps/amarok/icons/papirus-dark/
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

package_papirus-color-scheme-git() {
    pkgdesc="Modified and adaptive Paper color scheme for KDE"
    options=()
    optdepends=()
    conflicts=('papirus-color-scheme')
    install -Dm644 -t "${pkgdir}/usr/share/color-schemes/"   ${srcdir}/${_pkgname}/color-schemes/*.colors
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

package_papirus-gtk-theme-git() {
    pkgdesc="Modified and adaptive Paper GTK theme for KDE"
    options=()
    depends=('gtk-engine-murrine' 'gtk2' 'gtk3')
    optdepends=()
    conflicts=('papirus-gtk-theme')
    install -dm755 ${pkgdir}/usr/share/themes
    cp -r ${srcdir}/${_pkgname}/gtk-themes/papirus* ${pkgdir}/usr/share/themes/
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

package_papirus-aurorae-theme-git() {
    pkgdesc="Modified and adaptive Paper decorations for Kwin"
    options=()
    depends=('kwin')
    optdepends=()
    conflicts=('papirus-aurorae-theme')
    install -dm755 ${pkgdir}/usr/share/aurorae/themes
    cp -r ${srcdir}/${_pkgname}/aurorae-themes/Papirus* ${pkgdir}/usr/share/aurorae/themes/
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

package_papirus-qtcurve-theme-git() {
    pkgdesc="Modified and adaptive Paper decorations for QtCurve"
    options=()
    depends=('qtcurve-gtk2' 'qtcurve-qt4' 'qtcurve-qt5' 'qtcurve-utils' 'lib32-qtcurve-gtk2' 'lib32-qtcurve-qt4' 'lib32-qtcurve-utils')
    optdepends=()
    conflicts=('papirus-qtcurve-theme')
    install -Dm644 -t "${pkgdir}/usr/share/QtCurve/"   ${srcdir}/${_pkgname}/QtCurve/*.qtcurve
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

package_papirus-konsole-colorscheme-git() {
    pkgdesc="Modified and adaptive Paper colorscheme for Konsole"
    options=()
    depends=('konsole')
    optdepends=()
    conflicts=('papirus-konsole-colorscheme')
    install -Dm644 -t "${pkgdir}/usr/share/apps/konsole/"   ${srcdir}/${_pkgname}/konsole-colorschemes/*.colorscheme
    install -Dm644 -t "${pkgdir}/usr/share/konsole/"        ${srcdir}/${_pkgname}/konsole-colorschemes/*.colorscheme
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

package_papirus-yakuake-theme-git() {
    pkgdesc="Modified and adaptive Paper theme for Yakuake"
    options=()
    depends=()
    optdepends=('yakuake' 'yakuake-frameworks-git')
    conflicts=('papirus-yakuake-theme' 'yakuake-skin-papirus' 'yakuake-skin-papirus-dark' 'yakuake-skin-papirus-dark-frameworks' 'yakuake-skin-papirus-frameworks')
    install -dm755 ${pkgdir}/usr/share/{apps/yakuake/skins,yakuake/skins}
    cp -r ${srcdir}/${_pkgname}/yakuake-skins/papirus* ${pkgdir}/usr/share/apps/yakuake/skins/
    cp -r ${srcdir}/${_pkgname}/yakuake-skins/papirus* ${pkgdir}/usr/share/yakuake/skins/
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

package_bomi-skin-papirus-git() {
    pkgdesc="Papirus theme for Bomi"
    options=()
    depends=('bomi')
    optdepends=()
    conflicts=('bomi-skin-papirus')
    install -dm755 ${pkgdir}/usr/share/bomi/skins
    cp -r ${srcdir}/${_pkgname}/bomi-skin/Papirus ${pkgdir}/usr/share/bomi/skins/
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

package_libreoffice-papirus-theme-git() {
    pkgdesc="Libreoffice Papirus theme"
    options=()
    depends=()
    optdepends=('libreoffice' 'libreoffice-fresh-rpm')
    conflicts=('libreoffice-style-papirus' 'libreoffice-papirus-theme' 'libreoffice-fresh-rpm-papirus-theme')
    install -Dm644 -t "${pkgdir}/usr/lib/libreoffice/share/config/" ${srcdir}/${_pkgname}/libreoffice-icons/*.zip
    install -Dm644 -t "${pkgdir}/opt/libreoffice5.0/share/config/"  ${srcdir}/${_pkgname}/libreoffice-icons/*.zip
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

package_papirus-kmail-theme-git() {
    pkgdesc="Modified and adaptive Paper theme for Kmail"
    options=()
    depends=('kmail')
    optdepends=()
    conflicts=('papirus-kmail-theme')
    install -dm755 ${pkgdir}/usr/share/messageviewer/themes
    cp -r ${srcdir}/${_pkgname}/kmail-theme/papirus* ${pkgdir}/usr/share/messageviewer/themes/
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

package_papirus-vlc-theme-git() {
    pkgdesc="Modified and adaptive Paper theme for VLC Media Player"
    options=()
    depends=('vlc')
    conflicts=('papirus-vlc-theme')
    install -Dm644 -t "${pkgdir}/usr/share/vlc/skins2/" ${srcdir}/${_pkgname}/vlc-skins/*.vlt
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

package_papirus-k3b-theme-git() {
    pkgdesc="Modified and adaptive Paper theme for K3B"
    options=()
    depends=('k3b')
    install -dm755 ${pkgdir}/usr/share/{k3b/pics,apps/k3b/pics}
    cp -r ${srcdir}/${_pkgname}/k3b-themes/* ${pkgdir}/usr/share/k3b/pics/
    cp -r ${srcdir}/${_pkgname}/k3b-themes/* ${pkgdir}/usr/share/apps/k3b/pics/
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

package_papirus-smplayer-theme-git() {
    pkgdesc="Modified and adaptive Paper theme for SMPlayer"
    options=()
    depends=('smplayer')
    conflicts=('papirus-smplayer-theme')
    install -Dm644 -t "${pkgdir}/usr/share/smplayer/themes/Papirus/"        ${srcdir}/${_pkgname}/smplayer-themes/Papirus/*
    install -Dm644 -t "${pkgdir}/usr/share/smplayer/themes/PapirusDark/"    ${srcdir}/${_pkgname}/smplayer-themes/PapirusDark/*
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}
