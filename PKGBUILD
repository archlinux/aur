# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-wallpapers
_commit=92f3545 # 7 digits
pkgver=20160601
pkgrel=1
pkgdesc="Papirus Wallpapers Suite"
url="https://github.com/PapirusDevelopmentTeam/${pkgname}"
arch=('any')
license=('GPL')
depends=('plasma-desktop')
makedepends=('git' 'make')
conflicts=('papirus-wallpapers-git')
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
