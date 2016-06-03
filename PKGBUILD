# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-qtcurve-theme-git
pkgver=20160601
pkgrel=1
pkgdesc="Papirus decorations for QtCurve (git version)"
url="https://github.com/PapirusDevelopmentTeam/${pkgname%-git}"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qtcurve-gtk2' 'qtcurve-qt4' 'qtcurve-qt5' 'qtcurve-utils')
optdepends_x86_64=('lib32-qtcurve-gtk2' 'lib32-qtcurve-qt4' 'lib32-qtcurve-utils')
makedepends=('git' 'make')
conflicts=('papirus-qtcurve-theme')
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
