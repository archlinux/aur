# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-vlc-theme-git
pkgver=20160606
pkgrel=1
pkgdesc="Papirus theme for VLC Media Player (git version)"
url="https://github.com/PapirusDevelopmentTeam/${pkgname%-git}"
arch=('any')
license=('GPL')
depends=('vlc')
makedepends=('git' 'make')
conflicts=('papirus-vlc-theme')
options=('!strip')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    make -C "${pkgname}" install DESTDIR="$pkgdir"
}
