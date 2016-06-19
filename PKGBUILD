# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-look-and-feel
_commit=4721958 # 7 digits
pkgver=20160618
pkgrel=1
pkgdesc="Look-and-feel package for modified and adaptive Papirus theme for KDE"
url="https://github.com/PapirusDevelopmentTeam/${pkgname}"
arch=('any')
license=('GPL')
depends=('plasma-desktop')
makedepends=('git' 'make')
conflicts=('papirus-look-and-feel-git')
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
