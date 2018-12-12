# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-smplayer-theme-git
pkgver=20181024
pkgrel=1
pkgdesc="Papirus theme for SMPlayer (git version)"
url="https://github.com/PapirusDevelopmentTeam/${pkgname%-git}"
arch=('any')
license=('GPL')
depends=('smplayer')
makedepends=('git' 'make')
conflicts=('smplayer-themes' 'papirus-smplayer-theme')
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
