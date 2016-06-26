# Maintainer: droserasprout <droserasprout@tuta.io>
# Contributor: FadeMind <fademind@gmail.com>

pkgname=papirus-dark-aurorae-theme-git
pkgver=20160606
pkgrel=1
pkgdesc="Papirus Dark decorations for Kwin (git version)"
url="https://github.com/droserasprout/${pkgname%-git}"
arch=('any')
license=('GPL')
depends=('kwin')
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
