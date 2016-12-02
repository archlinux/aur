# Maintainer: FadeMind <fademind@gmail.com>

pkgname=arc-dark-suite-git
pkgver=20161202
pkgrel=1
pkgdesc='Arc-Dark customization for Plasma 5 (git version)'
arch=('any')
url='https://github.com/PapirusDevelopmentTeam/arc-kde'
license=('CCPL:by-sa')
options=('!strip')
makedepends=('git' 'make')
depends=('plasma-desktop' 'imagemagick')
conflicts=('arc-dark-suite')
optdepends=("gtk-theme-arc-git: A flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell (git version)"
            "papirus-icon-theme-kde-git: Papirus icon theme for KDE (git version)"
            "yakuake: A drop-down terminal emulator based on KDE konsole technology"
            "konsole: Terminal"
            "qt4-style-kvantum-svn: SVG theme engine for Qt4"
            "qt5-style-kvantum-svn: SVG theme engine for Qt5" 
            "kvantum-tools-qt5-svn: Kvantum config tools build against Qt5")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
install=INSTALL

pkgver(){
    cd ${pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    mkdir -p $pkgdir/usr/share
    cp -r $srcdir/$pkgname/aurorae $pkgdir/usr/share/
    cp -r $srcdir/$pkgname/color-schemes $pkgdir/usr/share/
    cp -r $srcdir/$pkgname/konsole $pkgdir/usr/share/
    cp -r $srcdir/$pkgname/Kvantum $pkgdir/usr/share/
    cp -r $srcdir/$pkgname/yakuake $pkgdir/usr/share/
    cp -r $srcdir/$pkgname/wallpapers $pkgdir/usr/share/
    cp -r $srcdir/$pkgname/konversation $pkgdir/usr/share/
}
