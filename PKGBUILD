# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-k3b-theme
_commit=270c635 # 7 digits
pkgver=20160603
pkgrel=1
pkgdesc="Papirus theme for K3B"
url="https://github.com/PapirusDevelopmentTeam/${pkgname}"
arch=('any')
license=('GPL')
depends=('k3b')
makedepends=('git' 'make')
conflicts=('papirus-k3b-theme-git')
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
