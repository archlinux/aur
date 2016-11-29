# Maintainer: Edgard Castro <castro@edgard.org>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: FadeMind <fademind@gmail.com>

pkgname=papirus-icon-theme-gtk-git
pkgver=20161129
pkgrel=1
pkgdesc="Papirus icon theme for GTK (git version)"
url="https://github.com/PapirusDevelopmentTeam/${pkgname%-git}"
arch=('any')
license=('LGPL3')
makedepends=('git')
conflicts=('papirus-gtk-icon-theme' 'papirus-gtk-icon-theme-git' 'papirus-icon-theme-gtk')
options=('!strip')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    cd ${pkgname}
    install -dm 755 "${pkgdir}"/usr/share/icons
    cp -dr --no-preserve='ownership' Papirus{,-Dark} "${pkgdir}"/usr/share/icons/
}
