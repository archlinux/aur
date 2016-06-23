# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-icon-theme-kde
_commit=cebe7a0 # 7 digits
pkgver=20160623
pkgrel=1
pkgdesc="Papirus icon theme for KDE"
url="https://github.com/PapirusDevelopmentTeam/${pkgname}"
arch=('any')
license=('GPL')
depends=('plasma-desktop')
makedepends=('git' 'make')
conflicts=('papirus-icon-theme-kde-git')
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
