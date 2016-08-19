# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-aurorae-theme
_commit=7947d99 # 7 digits
pkgver=20160813
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
    make -C "${pkgname}" install DESTDIR="$pkgdir"
}
