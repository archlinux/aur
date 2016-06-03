# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-sddm-theme-git
pkgver=20160603
pkgrel=1
pkgdesc="Papirus SDDM theme for KDE (git version)"
url="https://github.com/PapirusDevelopmentTeam/${pkgname%-git}"
arch=('any')
license=('GPL')
depends=('sddm' 'sddm-kcm')
makedepends=('git' 'make')
conflicts=('papirus-sddm-theme')
options=('!strip')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    cd ${pkgname}
    make install DESTDIR="$pkgdir"
}
