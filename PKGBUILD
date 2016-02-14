# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=d3795f0b84e6e4001536c4fc4b10a3869f8e3214
_repo=papirus-suite
pkgbase=papirus
pkgname=(
     'papirus'
     'papirus-icon-theme-gtk'
     'papirus-icon-theme-kde'
     'papirus-gtk-theme'
     'papirus-look-and-feel'
     'plasma-theme-papirus'
     'papirus-color-scheme'
     'papirus-qtcurve-theme'
     'papirus-aurorae-theme'
     'yakuake-skin-papirus'
     'papirus-konsole-colorscheme'
     'papirus-kmail-theme'
     'bomi-skin-papirus'
     'vlc-skin-papirus'
     'smplayer-theme-papirus'
     'libreoffice-style-papirus'
)
pkgver=20160214
pkgrel=1
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')

options=('!strip')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('d0609e4b0bab538b69fbd991ae1ec777da4d4c8c231a05f458df840d824c7a79')

package_papirus(){
    pkgdesc="Meta-package for modified and adaptive Paper theme"
    optdepends=(
    	'papirus-icon-theme-gtk: Modified and adaptive gtk Paper icon theme for Gnome'
    	'papirus-icon-theme-kde: Modified and adaptive Paper icon theme for KDE'
    	'papirus-gtk-theme: Modified and adaptive Paper gtk theme'
        'papirus-look-and-feel: Look-and-feel package for modified and adaptive Paper theme for KDE.'
        'plasma-theme-papirus: Modified and adaptive Paper plasma theme for KDE'
        'papirus-color-scheme: Modified and adaptive Paper color scheme for KDE'
        'papirus-qtcurve-theme: Modified and adaptive Paper decorations for QtCurve'
        'papirus-aurorae-theme: Modified and adaptive Paper decorations for Kwin'
        'yakuake-skin-papirus: Modified and adaptive Paper skin for Yakuake'
        'papirus-konsole-colorscheme: Modified and adaptive Paper colorscheme for Konsole'
        'papirus-kmail-theme: Modified and adaptive Paper theme for Kmail'
        'bomi-skin-papirus: Papirus theme for Bomi'
        'vlc-skin-papirus: Paper skin for VLC Media Player'
        'smplayer-theme-papirus: Papirus theme for SMPlayer'
        'libreoffice-style-papirus: Libreoffice Papirus theme'
    )
}


package_papirus-icon-theme-gtk() {
    pkgdesc="Modified and adaptive gtk Paper icon theme for Gnome"
    install -d ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/${_repo}-${_git}/gtk-icons/* ${pkgdir}/usr/share/icons/
    install -D -m644  ${srcdir}/${_repo}-${_git}/gtk-icons/Papirus-GTK/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}

package_papirus-icon-theme-kde() {
    pkgdesc="Modified and adaptive Paper icon theme for KDE"
    install -d ${pkgdir}/usr/share/icons
    install -d ${pkgdir}/usr/share/apps/amarok/icons/papirus
    install -d ${pkgdir}/usr/share/apps/amarok/icons/papirus-black-panel
    install -d ${pkgdir}/usr/share/apps/amarok/icons/papirus-dark
    cp -r ${srcdir}/${_repo}-${_git}/kde-pack/icons/papirus* ${pkgdir}/usr/share/icons/
    cp -r ${srcdir}/${_repo}-${_git}/kde-pack/icons/papirus/extra-icons/amarok/* ${pkgdir}/usr/share/apps/amarok/icons/papirus/
    cp -r ${srcdir}/${_repo}-${_git}/kde-pack/icons/papirus-black-panel/extra-icons/amarok/* ${pkgdir}/usr/share/apps/amarok/icons/papirus-black-panel/
    cp -r ${srcdir}/${_repo}-${_git}/kde-pack/icons/papirus-dark/extra-icons/amarok/* ${pkgdir}/usr/share/apps/amarok/icons/papirus-dark/
    install -D -m644  ${srcdir}/${_repo}-${_git}/kde-pack/icons/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 

package_papirus-gtk-theme() {
    pkgdesc="Modified and adaptive Paper gtk theme"
    depends=('gtk-engine-murrine' 'gdk-pixbuf2')
    optdepends=('lib32-gtk-engine-murrine' 'lib32-gdk-pixbuf2')
    install -d ${pkgdir}/usr/share/themes
    cp -r ${srcdir}/${_repo}-${_git}/kde-pack/gtk-themes/papirus* ${pkgdir}/usr/share/themes/
    install -D -m644  ${srcdir}/${_repo}-${_git}/kde-pack/gtk-themes/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 

package_papirus-look-and-feel() {
    pkgdesc="Look-and-feel package for modified and adaptive Paper theme for KDE."
    install -d ${pkgdir}/usr/share/plasma/look-and-feel
    cp -r ${srcdir}/${_repo}-${_git}/kde-pack/look-and-feel/* ${pkgdir}/usr/share/plasma/look-and-feel/
    install -D -m644  ${srcdir}/${_repo}-${_git}/kde-pack/plasma-themes/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 

package_plasma-theme-papirus() {
    pkgdesc="Papirus plasma theme for KDE"
    depends=('plasma-desktop')
    conflicts=('plasma-theme-papirus-git')
    install -d ${pkgdir}/usr/share/plasma/desktoptheme
    cp -r ${srcdir}/${_repo}-${_git}/kde-pack/plasma-themes/papirus* ${pkgdir}/usr/share/plasma/desktoptheme/
    install -D -m644  ${srcdir}/${_repo}-${_git}/kde-pack/plasma-themes/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 

package_papirus-color-scheme() {
    pkgdesc="Modified and adaptive Paper color scheme for KDE"
    install -d ${pkgdir}/usr/share/color-schemes
    cp -r ${srcdir}/${_repo}-${_git}/kde-pack/color-schemes/Papirus* ${pkgdir}/usr/share/color-schemes/
    install -D -m644  ${srcdir}/${_repo}-${_git}/kde-pack/color-schemes/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 

package_papirus-qtcurve-theme() {
    pkgdesc="Modified and adaptive Paper decorations for QtCurve"
    options=('!strip')
    depends=('qtcurve-gtk2' 'qtcurve-qt4' 'qtcurve-qt5' 'qtcurve-utils')
    optdepends=('lib32-qtcurve-gtk2' 'lib32-qtcurve-qt4' 'lib32-qtcurve-utils')
    makedepends=('git')
    conflicts=('papirus-qtcurve-theme-git')
    install -Dm644 -t "${pkgdir}/usr/share/QtCurve/" ${srcdir}/${_repo}-${_git}/kde-pack/QtCurve/*.qtcurve
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}

package_papirus-aurorae-theme() {
    pkgdesc="Modified and adaptive Paper decorations for Kwin"
    install -d ${pkgdir}/usr/share/aurorae/themes
    cp -r ${srcdir}/${_repo}-${_git}/kde-pack/aurorae-themes/Papirus* ${pkgdir}/usr/share/aurorae/themes/
    install -D -m644  ${srcdir}/${_repo}-${_git}/kde-pack/aurorae-themes/Papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 

package_yakuake-skin-papirus() {
    pkgdesc="Modified and adaptive Paper skin for Yakuake"
    depends=('yakuake')
    replaces=('papirus-yakuake-theme')
    install -d ${pkgdir}/usr/share/apps/yakuake/skins
    install -d ${pkgdir}/usr/share/yakuake/skins
    cp -r ${srcdir}/${_repo}-${_git}/kde-pack/yakuake-skins/papirus* ${pkgdir}/usr/share/apps/yakuake/skins/
    cp -r ${srcdir}/${_repo}-${_git}/kde-pack/yakuake-skins/papirus* ${pkgdir}/usr/share/yakuake/skins/
    install -D -m644  ${srcdir}/${_repo}-${_git}/kde-pack/yakuake-skins/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 

package_papirus-konsole-colorscheme() {
    pkgdesc="Modified and adaptive Paper colorscheme for Konsole"
    depends=('konsole')
    install -d ${pkgdir}/usr/share/apps/konsole
    install -d ${pkgdir}/usr/share/konsole
    cp -r ${srcdir}/${_repo}-${_git}/kde-pack/konsole-colorschemes/Papirus*.colorscheme ${pkgdir}/usr/share/apps/konsole/
    cp -r ${srcdir}/${_repo}-${_git}/kde-pack/konsole-colorschemes/Papirus*.colorscheme ${pkgdir}/usr/share/konsole/
    install -D -m644  ${srcdir}/${_repo}-${_git}/kde-pack/konsole-colorschemes/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 

package_papirus-kmail-theme() {
    pkgdesc="Modified and adaptive Paper theme for Kmail"
    depends=('kmail')
    install -d ${pkgdir}/usr/share/messageviewer/themes
    cp -r ${srcdir}/${_repo}-${_git}/kde-pack/kmail-theme/papirus* ${pkgdir}/usr/share/messageviewer/themes/
    install -D -m644  ${srcdir}/${_repo}-${_git}/kde-pack/color-schemes/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 

package_papirus-k3b-theme() {
    pkgdesc="Papirus theme for K3B"
    options=()
    depends=('k3b')
    install -dm755 ${pkgdir}/usr/share/{k3b/pics,apps/k3b/pics}
    cp -r ${srcdir}/${_repo}-${_git}/kde-pack/k3b-themes/* ${pkgdir}/usr/share/k3b/pics/
    cp -r ${srcdir}/${_repo}-${_git}/kde-pack/k3b-themes/* ${pkgdir}/usr/share/apps/k3b/pics/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}





package_bomi-skin-papirus() {
    pkgdesc="Papirus theme for Bomi"
    depends=('bomi')
    install -d ${pkgdir}/usr/share/bomi/skins
    cp -r ${srcdir}/${_repo}-${_git}/players-skins/bomi-skin/Papirus ${pkgdir}/usr/share/bomi/skins/
    install -D -m644  ${srcdir}/${_repo}-${_git}/players-skins/bomi-skin/Papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 

package_vlc-skin-papirus(){
    pkgdesc="Paper skin for VLC Media Player"
    depends=('vlc')
    install -dm755 ${pkgdir}/usr/share/vlc/skins2
    cp -r ${srcdir}/${_repo}-${_git}/players-skins/vlc-skins/Papirus* ${pkgdir}/usr/share/vlc/skins2/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}

package_smplayer-theme-papirus() {
    pkgdesc="Papirus theme for SMPlayer"
    options=()
    depends=('smplayer')
    conflicts=('papirus-smplayer-theme-git')
    install -Dm644 -t "${pkgdir}/usr/share/smplayer/themes/Papirus/"        ${srcdir}/${_repo}-${_git}/players-skins/smplayer-themes/Papirus/*
    install -Dm644 -t "${pkgdir}/usr/share/smplayer/themes/PapirusDark/"    ${srcdir}/${_repo}-${_git}/players-skins/smplayer-themes/PapirusDark/*
    find "${pkgdir}" -type f -exec chmod 644 {} \;
    find "${pkgdir}" -type d -exec chmod 755 {} \;
}

package_libreoffice-style-papirus() {
    pkgdesc="Libreoffice Papirus theme"
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






