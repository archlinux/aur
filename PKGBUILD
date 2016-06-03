# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-qtcurve-theme
_commit=6d8b3ea # 7 digits
pkgver=20160603
pkgrel=1
pkgdesc="Papirus decorations for QtCurve"
url="https://github.com/PapirusDevelopmentTeam/${pkgname}"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qtcurve-gtk2' 'qtcurve-qt4' 'qtcurve-qt5' 'qtcurve-utils')
optdepends_x86_64=('lib32-qtcurve-gtk2' 'lib32-qtcurve-qt4' 'lib32-qtcurve-utils')
makedepends=('git' 'make')
conflicts=('papirus-qtcurve-theme-git')
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
