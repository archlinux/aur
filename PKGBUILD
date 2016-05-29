# Maintainer: FadeMind <fademind@gmail.com>

pkgname='krusader-l10n-bin-git'
pkgver=20160529
pkgrel=1
pkgdesc="Language packs for Krusader KF5 GIT AUR release"
arch=('any')
url="https://github.com/FadeMind/${pkgname%-git}"
license=('GPL')
depends=('krusader-git')
makedepends=('git' 'make')
options=('!strip')
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname%-git}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    cd ${pkgname%-git}
    make install DESTDIR="$pkgdir"
} 
