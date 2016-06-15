# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-bomi-skin-git
pkgver=20160606
pkgrel=1
pkgdesc="Papirus theme for Bomi (git version)"
url="https://github.com/PapirusDevelopmentTeam/${pkgname%-git}"
arch=('any')
license=('GPL')
depends=('bomi-fresh')
makedepends=('git' 'make')
conflicts=('bomi-skin-papirus' 'bomi-skin-papirus-git' 'papirus-bomi-skin')
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
