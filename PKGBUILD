# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-sddm-theme
_commit=933e1b0 # 7 digits
pkgver=20160618
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
    make -C "${pkgname}" install DESTDIR="$pkgdir"
}
