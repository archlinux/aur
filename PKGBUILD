# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-plasma-theme
_commit=f88f002 # 7 digits
pkgver=20160603
pkgrel=1
pkgdesc="Papirus plasma theme for KDE"
url="https://github.com/PapirusDevelopmentTeam/${pkgname}"
arch=('any')
license=('GPL')
depends=('plasma-desktop')
makedepends=('git' 'make')
conflicts=('papirus-plasma-theme-git')
options=('!strip')
install="${pkgname}.install"
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
