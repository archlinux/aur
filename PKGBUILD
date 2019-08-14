# Maintainer: FadeMind <fademind@gmail.com>

pkgname=manjaro-material-blue-wallpaper-git
pkgver=20190814
pkgrel=1
pkgdesc="Manjaro Material Blue Wallpaper (git version)"
url="https://github.com/FadeMind/${pkgname%-git}"
arch=('any')
license=('GPL')
depends=('plasma-desktop')
makedepends=('git' 'make')
optdepends=('materia-kde' 'papirus-icon-theme')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
    cd ${pkgname%-git}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    cd ${pkgname%-git}
    make install DESTDIR="$pkgdir"
}
