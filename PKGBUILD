# Maintainer: FadeMind <fademind@gmail.com>

pkgname=arc-dark-suite-git
pkgver=20160603
pkgrel=1
pkgdesc='Arc-Dark customization for Plasma 5 (git version)'
arch=('any')
url='https://github.com/varlesh/Arc-Dark-KDE'
license=('CCPL:by-sa')
options=('!strip')
makedepends=('git' 'make')
depends=('plasma-desktop' 'imagemagick')
conflicts=('arc-dark-suite')
optdepends=("gtk-theme-arc-git: A flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell (git version)"
            "papirus-icon-theme-kde-git: Papirus icon theme for KDE (git version)"
            "yakuake: A drop-down terminal emulator based on KDE konsole technology"
            "konsole: Terminal"
            "qtcurve-utils: A configurable set of widget styles for KDE and Gtk")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
install=INSTALL

pkgver(){
    cd ${pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    cd ${pkgname}
    make install DESTDIR="$pkgdir"
}
