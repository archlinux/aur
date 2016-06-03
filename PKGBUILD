# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-libreoffice-theme-git
pkgver=20160601
pkgrel=1
pkgdesc="Papirus theme for LibreOffice (git version)"
url="https://github.com/PapirusDevelopmentTeam/${pkgname%-git}"
arch=('any')
license=('GPL')
depends=('plasma-desktop')
makedepends=('git' 'make')
conflicts=('papirus-libreoffice-theme' 'libreoffice-papirus-theme' 'libreoffice-papirus-theme-git')
optdepends=('libreoffice' 'libreoffice-fresh-rpm')
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
