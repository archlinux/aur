# Maintainer: FadeMind <fademind@gmail.com>

pkgname=papirus-wallpapers-git
pkgver=20160527
pkgrel=1
pkgdesc="Papirus Wallpapers Suite"
arch=('any')
url="https://github.com/FadeMind/${pkgname%-git}"
license=('GPL2')
makedepends=('git' 'make')
optdepends=('papirus-git')
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
