# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-icon-theme-gtk
_commit=a80143a # 7 digits
pkgver=20160705
pkgrel=1
pkgdesc="Papirus icon theme for GTK"
url="https://github.com/PapirusDevelopmentTeam/${pkgname}"
arch=('any')
license=('GPL')
depends=('gtk-update-icon-cache')
makedepends=('git' 'make')
conflicts=('papirus-gtk-icon-theme' 'papirus-gtk-icon-theme-git' 'papirus-icon-theme-gtk-git')
options=('!strip')
source=("${pkgname}::git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    make -C "${pkgname}" install DESTDIR="$pkgdir"
}
