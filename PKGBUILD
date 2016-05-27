# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Grigorii Horos <horosgrisa@gmail.com>

pkgbase=papirus-git
pkgname=(
         'bomi-skin-papirus-git'
         'libreoffice-papirus-theme-git'
         'papirus-git'
         'papirus-aurorae-theme-git'
         'papirus-color-scheme-git'
         'papirus-gtk-theme-git'
         'papirus-icon-theme-gtk-git'
         'papirus-icon-theme-kde-git'
         'papirus-k3b-theme-git'
         'papirus-kmail-theme-git'
         'papirus-konsole-colorscheme-git'
         'papirus-plasma-theme-git'
         'papirus-qtcurve-theme-git'
         'papirus-sddm-theme-git'
         'papirus-smplayer-theme-git'
         'papirus-vlc-theme-git'
         'papirus-yakuake-theme-git' 
         )
pkgver=r639.78516d1
pkgrel=1
pkgdesc="Papirus Suite for KDE (git version)"
arch=('any')
url="https://github.com/varlesh/papirus-suite"
license=('CCPL:by-sa')
options=('!strip')
makedepends=('git' 'make' 'xdg-utils')
depends=('gtk-update-icon-cache')
conflicts=('papirus')
source=("${pkgbase}::git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd ${pkgbase}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_bomi-skin-papirus-git() {
    pkgdesc="Papirus theme for Bomi"
    options=('!strip')
    makedepends=('git' 'make')
    depends=('bomi-fresh')
    optdepends=()
    conflicts=('bomi-skin-papirus')
    cd ${srcdir}/${pkgbase}/players-skins/bomi-skin/
    make install DESTDIR="$pkgdir"
}

package_libreoffice-papirus-theme-git() {
    pkgdesc="Papirus theme for Libreoffice"
    options=('!strip')
    makedepends=('git' 'make')
    depends=()
    optdepends=('libreoffice' 'libreoffice-fresh-rpm')
    conflicts=('libreoffice-style-papirus' 'libreoffice-papirus-theme' 'libreoffice-fresh-rpm-papirus-theme')
    cd  ${srcdir}/${pkgbase}/libreoffice-icons/
    make install DESTDIR="$pkgdir"
}

package_papirus-git() {
    pkgdesc="Meta-package for modified and adaptive Papirus theme (git version)"
    depends=(
             'papirus-aurorae-theme-git'
             'papirus-color-scheme-git'
             'papirus-gtk-theme-git'
             'papirus-icon-theme-kde-git'
             'papirus-konsole-colorscheme-git'
             'papirus-plasma-theme-git' 
             'papirus-sddm-theme-git'
             )
    optdepends=(
                "bomi-skin-papirus-git: Papirus theme for Bomi (git version)"
                "libreoffice-papirus-theme-git: Papirus theme for LibreOffice (git version)"
                "papirus-k3b-theme-git: Papirus theme for K3B (git version)"
                "papirus-kmail-theme-git: Papirus theme for KMail (git version)"
                "papirus-qtcurve-theme-git: Papirus decorations for QtCurve (git version)"
                "papirus-smplayer-theme-git: Papirus theme for SMPlayer (git version)"
                "papirus-vlc-theme-git: Papirus theme for VLC Media Player (git version)" 
                "papirus-yakuake-theme-git: Papirus theme for Yakuake (git version)"
                "papirus-wallpapers-git: Papirus wallpapers suite (git version)"
                )
} 

package_papirus-aurorae-theme-git() {
    pkgdesc="Papirus decorations for Kwin (git version)"
    options=('!strip')
    makedepends=('git' 'make')
    depends=('kwin')
    optdepends=()
    conflicts=('papirus-aurorae-theme')
    cd  ${srcdir}/${pkgbase}/kde-pack/aurorae-themes/
    make install DESTDIR="$pkgdir"
}

package_papirus-color-scheme-git() {
    pkgdesc="Papirus color scheme for KDE (git version)"
    options=('!strip')
    makedepends=('git' 'make')
    depends=('plasma-desktop')
    optdepends=()
    conflicts=('papirus-color-scheme')
    cd  ${srcdir}/${pkgbase}/kde-pack/color-schemes/
    make install DESTDIR="$pkgdir"
}

package_papirus-gtk-theme-git() {
    pkgdesc="Papirus GTK theme for KDE (git version)"
    options=('!strip')
    makedepends=('git' 'make')
    depends=('gtk-engine-murrine' 'gtk2' 'gtk3')
    optdepends=()
    conflicts=('papirus-gtk-theme')
    cd  ${srcdir}/${pkgbase}/kde-pack/gtk-themes/
    make install DESTDIR="$pkgdir"
}

package_papirus-icon-theme-gtk-git() {
    pkgdesc="Papirus icon theme for GTK (git version)"
    options=('!strip')
    makedepends=('git' 'xdg-utils')
    depends=('gtk-update-icon-cache')
    optdepends=()
    conflicts=('papirus-gtk-icon-theme' 'papirus-gtk-icon-theme-git' 'papirus-icon-theme-gtk')
    cd  ${srcdir}/${pkgbase}/gtk-icons/
    make install DESTDIR="$pkgdir"
}

package_papirus-icon-theme-kde-git() {
    pkgdesc="Papirus icon theme for KDE (git version)"
    options=('!strip')
    makedepends=('git' 'make' 'xdg-utils')
    depends=('gtk-update-icon-cache')
    optdepends=()
    conflicts=('papirus-icon-theme' 'papirus-icon-theme-kde' 'papirus-icon-theme-git')
    cd  ${srcdir}/${pkgbase}/kde-pack/icons/
    make install DESTDIR="$pkgdir"
}

package_papirus-k3b-theme-git() {
    pkgdesc="Papirus theme for K3B (git version)"
    options=('!strip')
    makedepends=('git' 'make')
    depends=('k3b')
    optdepends=()
    cd  ${srcdir}/${pkgbase}/kde-pack/k3b-themes/
    make install DESTDIR="$pkgdir"
}

package_papirus-kmail-theme-git() {
    pkgdesc="Papirus theme for Kmail (git version)"
    options=('!strip')
    makedepends=('git' 'make')
    depends=('kmail')
    optdepends=()
    conflicts=('papirus-kmail-theme')
    cd  ${srcdir}/${pkgbase}/kde-pack/kmail-theme/
    make install DESTDIR="$pkgdir"
}

package_papirus-konsole-colorscheme-git() {
    pkgdesc="Papirus colorscheme for Konsole (git version)"
    options=('!strip')
    makedepends=('git' 'make')
    depends=('konsole')
    optdepends=()
    conflicts=('papirus-konsole-colorscheme')
    cd ${srcdir}/${pkgbase}/kde-pack/konsole-colorschemes/
    make install DESTDIR="$pkgdir"
}

package_papirus-plasma-theme-git() {
    pkgdesc="Papirus plasma theme for KDE (git version)"
    options=('!strip')
    makedepends=('git' 'make')
    depends=('plasma-desktop')
    optdepends=()
    conflicts=('papirus-look-and-feel' 'plasma-theme-papirus')
    install='plasma-refresh.install'
    cd  ${srcdir}/${pkgbase}/kde-pack/look-and-feel/
    make install DESTDIR="$pkgdir"
    cd  ${srcdir}/${pkgbase}/kde-pack/plasma-themes/
    make install DESTDIR="$pkgdir"
}

package_papirus-qtcurve-theme-git() {
    pkgdesc="Papirus decorations for QtCurve (git version)"
    arch=('i686' 'x86_64')
    options=('!strip')
    makedepends=('git' 'make')
    depends=('qtcurve-gtk2' 'qtcurve-qt4' 'qtcurve-qt5' 'qtcurve-utils')
    optdepends_x86_64=('lib32-qtcurve-gtk2' 'lib32-qtcurve-qt4' 'lib32-qtcurve-utils')
    conflicts=('papirus-qtcurve-theme')
    cd  ${srcdir}/${pkgbase}/kde-pack/QtCurve/
    make install DESTDIR="$pkgdir"
}

package_papirus-sddm-theme-git() {
    pkgdesc="Papirus theme for SDDM (git version)"
    options=('!strip')
    makedepends=('git' 'make')
    depends=('sddm' 'sddm-kcm')
    optdepends=()
    conflicts=('papirus-sddm-theme')
    cd ${srcdir}/${pkgbase}/kde-pack/sddm-themes/
    make install DESTDIR="$pkgdir"
}

package_papirus-smplayer-theme-git() {
    pkgdesc="Papirus theme for SMPlayer (git version)"
    options=('!strip')
    makedepends=('git' 'make')
    depends=('smplayer')
    optdepends=()
    conflicts=('papirus-smplayer-theme')
    cd ${srcdir}/${pkgbase}/players-skins/smplayer-themes/
    make install DESTDIR="$pkgdir"
}

package_papirus-vlc-theme-git() {
    pkgdesc="Papirus theme for VLC Media Player (git version)"
    options=('!strip')
    makedepends=('git' 'make')
    depends=('vlc')
    optdepends=()
    conflicts=('papirus-vlc-theme')
    cd ${srcdir}/${pkgbase}/players-skins/vlc-skins/
    make install DESTDIR="$pkgdir"
}

package_papirus-yakuake-theme-git() {
    pkgdesc="Papirus theme for Yakuake (git version)"
    options=('!strip')
    makedepends=('git' 'make')
    depends=('yakuake')
    optdepends=()
    conflicts=('papirus-yakuake-theme' 'yakuake-skin-papirus' 'yakuake-skin-papirus-dark' 'yakuake-skin-papirus-dark-frameworks' 'yakuake-skin-papirus-frameworks')
    cd ${srcdir}/${pkgbase}/kde-pack/yakuake-skins/
    make install DESTDIR="$pkgdir"
}
