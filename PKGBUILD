# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=256e5c2d34a1fb7d6ceaf91d4b12f9afd839e6af
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
    'papirus-k3b-theme'
    'bomi-skin-papirus'
    'vlc-skin-papirus'
    'smplayer-theme-papirus'
    'libreoffice-style-papirus'
)
pkgver=20160601
pkgrel=1
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')

options=('!strip')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('1b1602b016bae5c524f54e302cd71b0c61e2c2cf5a6b117d9529160b1ba80e9d')

package_papirus(){
    pkgdesc="Meta-package for modified and adaptive Papirus theme"
    optdepends=(
    	'papirus-icon-theme-gtk: Modified and adaptive gtk Papirus icon theme for Gnome'
    	'papirus-icon-theme-kde: Modified and adaptive Papirus icon theme for KDE'
    	'papirus-gtk-theme: Modified and adaptive Papirus gtk theme'
        'papirus-look-and-feel: Look-and-feel package for modified and adaptive Papirus theme for KDE.'
        'plasma-theme-papirus: Modified and adaptive Papirus plasma theme for KDE'
        'papirus-color-scheme: Modified and adaptive Papirus color scheme for KDE'
        'papirus-qtcurve-theme: Modified and adaptive Papirus decorations for QtCurve'
        'papirus-aurorae-theme: Modified and adaptive Papirus decorations for Kwin'
        'yakuake-skin-papirus: Modified and adaptive Papirus skin for Yakuake'
        'papirus-konsole-colorscheme: Modified and adaptive Papirus colorscheme for Konsole'
        'papirus-kmail-theme: Modified and adaptive Papirus theme for Kmail'
        'papirus-k3b-theme: Papirus theme for K3B'
        'bomi-skin-papirus: Papirus theme for Bomi'
        'vlc-skin-papirus: Papirus skin for VLC Media Player'
        'smplayer-theme-papirus: Papirus theme for SMPlayer'
        'libreoffice-style-papirus: Libreoffice Papirus theme'
    )
}


package_papirus-icon-theme-gtk() {
    pkgdesc="Modified and adaptive gtk Papirus icon theme for GTK"
    options=('!strip')
    makedepends=('make' 'xdg-utils')
    optdepends=('gtk-update-icon-cache')
    conflicts=('papirus-icon-theme-gtk-git')
    cd  ${srcdir}/${_repo}-${_git}/gtk-icons/
    make install DESTDIR="$pkgdir"
}

package_papirus-icon-theme-kde() {
    pkgdesc="Modified and adaptive Papirus icon theme for KDE"
    options=('!strip')
    makedepends=('git' 'make' 'xdg-utils')
    optdepends=('gtk-update-icon-cache')
    conflicts=('package_papirus-icon-theme-kde-git')
    cd  ${srcdir}/${_repo}-${_git}/kde-pack/icons/
    make install DESTDIR="$pkgdir"
} 

package_papirus-gtk-theme() {
    pkgdesc="Modified and adaptive Papirus gtk theme"
    options=('!strip')
    depends=('gtk-engine-murrine' 'gdk-pixbuf2')
    optdepends=('gtk2' 'gtk3' 'lib32-gtk-engine-murrine' 'lib32-gdk-pixbuf2')
    makedepends=('git' 'make')
    conflicts=('papirus-gtk-theme-git')
    cd  ${srcdir}/${_repo}-${_git}/kde-pack/gtk-themes/
    make install DESTDIR="$pkgdir"
} 

package_papirus-look-and-feel() {
    pkgdesc="Look-and-feel package for modified and adaptive Papirus theme for KDE."
    options=('!strip')
    makedepends=('git' 'make')
    depends=('plasma-desktop')
    conflicts=('papirus-plasma-theme-git')
    install='plasma-refresh.install'
    cd  ${srcdir}/${_repo}-${_git}/kde-pack/look-and-feel/
    make install DESTDIR="$pkgdir"
} 

package_plasma-theme-papirus() {
    pkgdesc="Papirus plasma theme for KDE"
    options=('!strip')
    makedepends=('git' 'make')
    depends=('plasma-desktop')
    conflicts=('papirus-plasma-theme-git')
    cd  ${srcdir}/${_repo}-${_git}/kde-pack/plasma-themes/
    make install DESTDIR="$pkgdir"
} 

package_papirus-color-scheme() {
    pkgdesc="Modified and adaptive Papirus color scheme for KDE"
    makedepends=('git' 'make')
    depends=('plasma-desktop')
    conflicts=('papirus-color-scheme-git')
    cd  ${srcdir}/${_repo}-${_git}/kde-pack/color-schemes/
    make install DESTDIR="$pkgdir"
} 

package_papirus-qtcurve-theme() {
    pkgdesc="Modified and adaptive Papirus decorations for QtCurve"
    options=('!strip')
    depends=('qtcurve-gtk2' 'qtcurve-qt4' 'qtcurve-qt5' 'qtcurve-utils')
    optdepends=('lib32-qtcurve-gtk2' 'lib32-qtcurve-qt4' 'lib32-qtcurve-utils')
    makedepends=('git' 'make')
    conflicts=('papirus-qtcurve-theme-git')
    cd  ${srcdir}/${_repo}-${_git}/kde-pack/QtCurve/
    make install DESTDIR="$pkgdir"
}

package_papirus-aurorae-theme() {
    pkgdesc="Modified and adaptive Papirus decorations for Kwin"
    options=('!strip')
    makedepends=('git' 'make')
    depends=('kwin')
    cd  ${srcdir}/${_repo}-${_git}/kde-pack/aurorae-themes/
    make install DESTDIR="$pkgdir"
} 

package_yakuake-skin-papirus() {
    pkgdesc="Modified and adaptive Papirus skin for Yakuake"
    options=('!strip')
    makedepends=('git' 'make')
    depends=('yakuake')
    conflicts=('papirus-yakuake-theme' 'papirus-yakuake-theme-git')
    replaces=('papirus-yakuake-theme')
    cd ${srcdir}/${_repo}-${_git}/kde-pack/yakuake-skins/
    make install DESTDIR="$pkgdir"
} 

package_papirus-konsole-colorscheme() {
    pkgdesc="Modified and adaptive Papirus colorscheme for Konsole"
    options=('!strip')
    makedepends=('git' 'make')
    depends=('konsole')
    conflicts=('papirus-konsole-colorscheme-git')
    cd ${srcdir}/${_repo}-${_git}/kde-pack/konsole-colorschemes/
    make install DESTDIR="$pkgdir"
} 

package_papirus-kmail-theme() {
    pkgdesc="Modified and adaptive Papirus theme for Kmail"
    options=('!strip')
    makedepends=('git' 'make')
    depends=('kmail')
    conflicts=('papirus-kmail-theme-git')
    cd  ${srcdir}/${_repo}-${_git}/kde-pack/kmail-theme/
    make install DESTDIR="$pkgdir"
} 

package_papirus-k3b-theme() {
    pkgdesc="Papirus theme for K3B"
    options=('!strip')
    makedepends=('git' 'make')
    depends=('k3b')
    cd  ${srcdir}/${_repo}-${_git}/kde-pack/k3b-themes/
    make install DESTDIR="$pkgdir"
}





package_bomi-skin-papirus() {
    pkgdesc="Papirus theme for Bomi"
    options=('!strip')
    makedepends=('git' 'make')
    depends=('bomi-fresh')
    conflicts=('bomi-skin-papirus-git')
    cd ${srcdir}/${_repo}-${_git}/players-skins/bomi-skin/
    make install DESTDIR="$pkgdir"
} 

package_vlc-skin-papirus(){
    pkgdesc="Papirus skin for VLC Media Player"
    options=('!strip')
    makedepends=('git' 'make')
    depends=('vlc')
    conflicts=('papirus-vlc-theme-git')
    cd ${srcdir}/${_repo}-${_git}/players-skins/vlc-skins/
    make install DESTDIR="$pkgdir"
}

package_smplayer-theme-papirus() {
    pkgdesc="Papirus theme for SMPlayer"
    options=('!strip')
    makedepends=('git' 'make')
    depends=('smplayer')
    conflicts=('papirus-smplayer-theme-git')
    cd ${srcdir}/${_repo}-${_git}/players-skins/smplayer-themes/
    make install DESTDIR="$pkgdir"
}

package_libreoffice-style-papirus() {
    pkgdesc="Libreoffice Papirus theme"
    options=('!strip')
    depends=('libreoffice')
    makedepends=('git' 'make')
    replaces=('libreoffice-papirus-theme')
    conflicts=('libreoffice-papirus-theme-git')
    cd  ${srcdir}/${_repo}-${_git}/libreoffice-icons/
    make install DESTDIR="$pkgdir"
}






