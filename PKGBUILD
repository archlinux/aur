# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-aurorae-theme
_commit=ee273e8 # 7 digits
pkgver=20160601
pkgrel=1
pkgdesc="Papirus decorations for Kwin"
url="https://github.com/PapirusDevelopmentTeam/${pkgname}"
arch=('any')
license=('GPL')
depends=('kwin')
makedepends=('git' 'make')
conflicts=('papirus-aurorae-theme-git')
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
