# Maintainer: droserasprout <droserasprout@tuta.io>
# Contributor: FadeMind <fademind@gmail.com>

pkgname=papirus-dark-color-scheme-git
pkgver=20160615
pkgrel=1
pkgdesc="Papirus Dark color scheme for KDE (git version)"
url="https://github.com/droserasprout/${pkgname%-git}"
arch=('any')
license=('GPL')
depends=('plasma-desktop')
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
