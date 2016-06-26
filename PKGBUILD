# Maintainer: droserasprout <droserasprout@tuta.io>
# Contributor: FadeMind <fademind@gmail.com>

pkgname=papirus-dark-yakuake-theme-git
pkgver=20160606
pkgrel=1
pkgdesc="Papirus Dark theme for Yakuake (git version)"
url="https://github.com/droserasprout/${pkgname%-git}"
arch=('any')
license=('GPL')
depends=('yakuake')
makedepends=('git' 'make')
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
