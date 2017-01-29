# Maintainer: FadeMind <fademind@gmail.com>

pkgname='k3b-l10n-bin-git'
pkgver=20170129
pkgrel=1
pkgdesc="Language packs for K3B KF5 GIT version"
arch=('any')
url="https://github.com/FadeMind/${pkgname%-git}"
license=('GPL')
makedepends=('git' 'make')
optdepends=('k3b-git: K3B KF5 GIT version')
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname%-git}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    make -C "${pkgname%-git}" install DESTDIR="$pkgdir"
}
