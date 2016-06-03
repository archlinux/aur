# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-yakuake-theme
_commit=b302cdd # 7 digits
pkgver=20160603
pkgrel=1
pkgdesc="Papirus theme for Yakuake"
url="https://github.com/PapirusDevelopmentTeam/${pkgname}"
arch=('any')
license=('GPL')
depends=('yakuake')
makedepends=('git' 'make')
conflicts=('papirus-yakuake-theme-git')
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
