# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-konsole-colorscheme
_commit=3048aea # 7 digits
pkgver=20160601
pkgrel=1
pkgdesc="Papirus color scheme for Konsole"
url="https://github.com/PapirusDevelopmentTeam/${pkgname}"
arch=('any')
license=('GPL')
depends=('konsole')
makedepends=('git' 'make')
conflicts=('papirus-konsole-colorscheme-git')
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
