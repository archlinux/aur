# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-icon-theme-gtk-git
pkgver=20160615
pkgrel=1
pkgdesc="Papirus icon theme for GTK (git version)"
url="https://github.com/PapirusDevelopmentTeam/${pkgname%-git}"
arch=('any')
license=('GPL')
depends=('gtk-update-icon-cache')
makedepends=('git' 'make')
conflicts=('papirus-gtk-icon-theme' 'papirus-gtk-icon-theme-git' 'papirus-icon-theme-gtk')
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
