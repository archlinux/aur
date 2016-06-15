# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-gtk-theme-git
pkgver=20160606
pkgrel=1
pkgdesc="Papirus GTK theme for KDE (git version)"
url="https://github.com/PapirusDevelopmentTeam/${pkgname%-git}"
arch=('i686' 'x86_64')
license=('GPL')
depends=('plasma-desktop' 'gtk2' 'gtk3' 'gtk-engine-murrine')
optdepends_x86_64=('lib32-gtk2' 'lib32-gtk3' 'lib32-gtk-engine-murrine')
makedepends=('git' 'make')
conflicts=('papirus-gtk-theme')
options=('!strip')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    make -C "${pkgname}" install DESTDIR="$pkgdir"
}
