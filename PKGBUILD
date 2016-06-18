# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-sddm-theme
_commit=4257b11 # 7 digits
pkgver=20160615
pkgrel=1
pkgdesc="Papirus SDDM theme for KDE"
url="https://github.com/PapirusDevelopmentTeam/${pkgname}"
arch=('any')
license=('GPL')
depends=('sddm')
makedepends=('git' 'make')
conflicts=('papirus-sddm-theme-git')
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
