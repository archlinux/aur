# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-bomi-skin
_commit=8ba763a # 7 digits
pkgver=20160601
pkgrel=1
pkgdesc="Papirus theme for Bomi"
url="https://github.com/PapirusDevelopmentTeam/${pkgname}"
arch=('any')
license=('GPL')
depends=('bomi-fresh')
makedepends=('git' 'make')
conflicts=('bomi-skin-papirus' 'bomi-skin-papirus-git' 'papirus-bomi-skin-git')
options=('!strip')
source=("${pkgname}::git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    cd ${pkgname}
    make install DESTDIR="$pkgdir"
}
