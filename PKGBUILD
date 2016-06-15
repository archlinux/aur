# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-look-and-feel-git
pkgver=20160615
pkgrel=1
pkgdesc="Look-and-feel package for modified and adaptive Papirus theme for KDE (git version)"
url="https://github.com/PapirusDevelopmentTeam/${pkgname%-git}"
arch=('any')
license=('GPL')
depends=('plasma-desktop')
makedepends=('git' 'make')
conflicts=('papirus-look-and-feel')
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
