# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=e8ea84fd7b02b780f7e3aa51887ebc0155e5245a
_repo=papirus-pack-kde
pkgbase=papirus
pkgname=( 'papirus' 'bomi-skin-papirus' 'libreoffice-style-papirus' 'papirus-color-scheme' 'papirus-kmail-theme' 'plasma-theme-papirus' 'papirus-gtk-theme' 'papirus-konsole-colorscheme' 'yakuake-skin-papirus' 'vlc-skin-papirus' 'papirus-aurorae-theme' 'papirus-icon-theme' 'papirus-plasma-theme' )
pkgver=20151218
pkgrel=1
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')

options=('!strip')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('5a378c5bec12d3ef149dc038a409c8dfd1e09bf1c16f0bec40c214e904c71b64')

package_papirus() {
    pkgdesc="Look-and-feel package for modified and adaptive Paper theme for KDE."
    depends=('plasma-theme-papirus' 'papirus-icon-theme' 'papirus-color-scheme' 'papirus-gtk-theme')
    optdepends=('yakuake-skin-papirus: Modified and adaptive Paper skin for Yakuake'
                'papirus-konsole-colorscheme: Modified and adaptive Paper colorscheme for Konsole'
                'papirus-kmail-theme: Modified and adaptive Paper theme for Kmail'
                'bomi-skin-papirus: Papirus theme for Bomi'
                'libreoffice-style-papirus: Papirus theme for Libreoffice'
                'vlc-skin-papirus: Paper skin for VLC Media Player')
   install -d ${pkgdir}/usr/share/plasma/look-and-feel
   cp -r ${srcdir}/${_repo}-${_git}/look-and-feel/* ${pkgdir}/usr/share/plasma/look-and-feel/
   install -D -m644  ${srcdir}/${_repo}-${_git}/plasma-themes/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
   find ${pkgdir}/usr -type f -exec chmod 644 {} \;
   find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 

package_bomi-skin-papirus() {
    pkgdesc="Papirus theme for Bomi"
    depends=('bomi')
    install -d ${pkgdir}/usr/share/bomi/skins
    cp -r ${srcdir}/${_repo}-${_git}/bomi-skin/Papirus ${pkgdir}/usr/share/bomi/skins/
    install -D -m644  ${srcdir}/${_repo}-${_git}/bomi-skin/Papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 


package_libreoffice-style-papirus() {
    pkgdesc="Libreoffice Papirus theme "
    depends=('libreoffice')
    replaces=('libreoffice-papirus-theme')
    install -d ${pkgdir}/usr/lib/libreoffice/share/config
    install -Dm644 -t "${pkgdir}/usr/lib/libreoffice/share/config/" ${srcdir}/${_repo}-${_git}/libreoffice-icons/*.zip
    install -Dm644 -t "${pkgdir}/opt/libreoffice5.0/share/config/"  ${srcdir}/${_repo}-${_git}/libreoffice-icons/*.zip
    install -D -m644  ${srcdir}/${_repo}-${_git}/libreoffice-icons/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
    find ${pkgdir}/opt -type f -exec chmod 644 {} \;
    find ${pkgdir}/opt -type d -exec chmod 755 {} \;
} 

package_papirus-aurorae-theme() {
    pkgdesc="Modified and adaptive Paper decorations for Kwin"
    install -d ${pkgdir}/usr/share/aurorae/themes
    cp -r ${srcdir}/${_repo}-${_git}/aurorae-themes/Papirus* ${pkgdir}/usr/share/aurorae/themes/
    install -D -m644  ${srcdir}/${_repo}-${_git}/aurorae-themes/Papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 

package_papirus-color-scheme() {
    pkgdesc="Modified and adaptive Paper color scheme for KDE"
    install -d ${pkgdir}/usr/share/color-schemes
    cp -r ${srcdir}/${_repo}-${_git}/color-schemes/Papirus* ${pkgdir}/usr/share/color-schemes/
    install -D -m644  ${srcdir}/${_repo}-${_git}/color-schemes/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 

package_papirus-gtk-theme() {
    pkgdesc="Modified and adaptive Paper gtk theme"
    depends=('gtk-engine-murrine' 'gdk-pixbuf2')
    optdepends=('lib32-gtk-engine-murrine' 'lib32-gdk-pixbuf2')
    install -d ${pkgdir}/usr/share/themes
    cp -r ${srcdir}/${_repo}-${_git}/gtk-themes/papirus* ${pkgdir}/usr/share/themes/
    install -D -m644  ${srcdir}/${_repo}-${_git}/gtk-themes/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 

package_papirus-icon-theme() {
    pkgdesc="Modified and adaptive Paper icon theme for KDE"
    install -d ${pkgdir}/usr/share/icons
    install -d ${pkgdir}/usr/share/apps/amarok/icons/papirus
    install -d ${pkgdir}/usr/share/apps/amarok/icons/papirus-black-panel
    install -d ${pkgdir}/usr/share/apps/amarok/icons/papirus-dark
    cp -r ${srcdir}/${_repo}-${_git}/icons/papirus* ${pkgdir}/usr/share/icons/
    cp -r ${srcdir}/${_repo}-${_git}/icons/papirus/extra-icons/amarok/* ${pkgdir}/usr/share/apps/amarok/icons/papirus/
    cp -r ${srcdir}/${_repo}-${_git}/icons/papirus-black-panel/extra-icons/amarok/* ${pkgdir}/usr/share/apps/amarok/icons/papirus-black-panel/
    cp -r ${srcdir}/${_repo}-${_git}/icons/papirus-dark/extra-icons/amarok/* ${pkgdir}/usr/share/apps/amarok/icons/papirus-dark/
    install -D -m644  ${srcdir}/${_repo}-${_git}/icons/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 

package_papirus-kmail-theme() {
    pkgdesc="Modified and adaptive Paper theme for Kmail"
    depends=('kmail')
    install -d ${pkgdir}/usr/share/messageviewer/themes
    cp -r ${srcdir}/${_repo}-${_git}/kmail-theme/papirus* ${pkgdir}/usr/share/messageviewer/themes/
    install -D -m644  ${srcdir}/${_repo}-${_git}/color-schemes/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 


package_papirus-konsole-colorscheme() {
    pkgdesc="Modified and adaptive Paper colorscheme for Konsole"
    depends=('konsole')
    install -d ${pkgdir}/usr/share/apps/konsole
    install -d ${pkgdir}/usr/share/konsole
    cp -r ${srcdir}/${_repo}-${_git}/konsole-colorschemes/Papirus*.colorscheme ${pkgdir}/usr/share/apps/konsole/
    cp -r ${srcdir}/${_repo}-${_git}/konsole-colorschemes/Papirus*.colorscheme ${pkgdir}/usr/share/konsole/
    install -D -m644  ${srcdir}/${_repo}-${_git}/konsole-colorschemes/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 


package_plasma-theme-papirus() {
    pkgdesc="Modified and adaptive Paper plasma theme for KDE"
    replaces=('papirus-plasma-theme')
    install -d ${pkgdir}/usr/share/plasma/desktoptheme
    cp -r ${srcdir}/${_repo}-${_git}/plasma-themes/papirus* ${pkgdir}/usr/share/plasma/desktoptheme/
    install -D -m644  ${srcdir}/${_repo}-${_git}/plasma-themes/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 


package_yakuake-skin-papirus() {
    pkgdesc="Modified and adaptive Paper skin for Yakuake"
    depends=('yakuake')
    replaces=('papirus-yakuake-theme')
    install -d ${pkgdir}/usr/share/apps/yakuake/skins
    install -d ${pkgdir}/usr/share/yakuake/skins
    echo ${srcdir}/${_repo}-${_git}/yakuake-skins/papirus*
    cp -r ${srcdir}/${_repo}-${_git}/yakuake-skins/papirus* ${pkgdir}/usr/share/apps/yakuake/skins/
    cp -r ${srcdir}/${_repo}-${_git}/yakuake-skins/papirus* ${pkgdir}/usr/share/yakuake/skins/
    install -D -m644  ${srcdir}/${_repo}-${_git}/yakuake-skins/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 


package_vlc-skin-papirus(){
    pkgdesc="Paper skin for VLC Media Player"
    options=('!strip')
    depends=('vlc')
    install -dm755 ${pkgdir}/usr/share/vlc/skins2
    cp -r ${srcdir}/${_repo}-${_git}//vlc-skins/Papirus* ${pkgdir}/usr/share/vlc/skins2/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}

package_papirus-plasma-theme(){
    pkgdesc="This is fake package, please install \`plasma-theme-papirus\`"
    depends=('plasma-theme-papirus')
    echo This is fake package, please install '`plasma-theme-papirus`'
}
