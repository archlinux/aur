# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-smplayer-theme
_commit=d90a072 # 7 digits
pkgver=20160603
pkgrel=1
pkgdesc="Papirus theme for SMPlayer"
url="https://github.com/PapirusDevelopmentTeam/${pkgname}"
arch=('any')
license=('GPL')
depends=('smplayer')
makedepends=('git' 'make')
conflicts=('papirus-smplayer-theme-git')
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
