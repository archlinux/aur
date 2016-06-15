# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-kvantum-theme-git
pkgver=20160615
pkgrel=1
pkgdesc="Papirus theme for Kvantum theme engine (git version)"
url="https://github.com/PapirusDevelopmentTeam/${pkgname%-git}"
arch=('any')
license=('GPL')
depends=(qt{4,5}-style-kvantum-svn kvantum-tools-qt5-svn)
makedepends=('git' 'make')
conflicts=('papirus-kvantum-theme')
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
