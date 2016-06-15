# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-kmail-theme-git
pkgver=20160615
pkgrel=1
pkgdesc="Papirus theme for KMail (git version)"
url="https://github.com/PapirusDevelopmentTeam/${pkgname%-git}"
arch=('any')
license=('GPL')
depends=('kmail')
makedepends=('git' 'make')
conflicts=('papirus-kmail-theme')
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
