# Maintainer: droserasprout <droserasprout@tuta.io>
# Contributor: FadeMind <fademind@gmail.com>

pkgname=papirus-dark-plasma-theme-git
pkgver=20160928
pkgrel=1
pkgdesc="Papirus Dark theme for KDE Plasma 5"
url="https://github.com/papirus-dark/${pkgname%-git}"
arch=('any')
license=('GPL')
depends=('plasma-desktop')
makedepends=('git' 'make')
options=('!strip')
install="${pkgname}.install"
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    make -C "${pkgname}" install DESTDIR="$pkgdir"
}
