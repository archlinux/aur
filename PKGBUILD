# Maintainer: Your Name <youremail@domain.com>
_pkgname=kde-gruvbox
pkgname=${_pkgname}-git
pkgver=r6.2dd9528
pkgrel=3
pkgdesc="A suite of themes for KDE applications that match the retro gruvbox colorscheme"
arch=(any)
url="https://github.com/printesoi/kde-gruvbox"
license=('MIT')
depends=(plasma-workspace)
makedepends=(git)
optdepends=()
provides=(kde-gruvbox)
conflicts=(kde-gruvbox)
source=("git+https://github.com/printesoi/kde-gruvbox.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    rm ./*/README.md
    rm ./yakuake/TODO
}

package() {
    cd "$_pkgname"
    install -Dm755 konsole $pkgdir/usr/share/konsole
    install -Dm755 yakuake $pkgdir/usr/share/apps/yakuake/kns_skins
    install -Dm755 color-schemes $pkgdir/usr/share/color-schemes
    install -Dm755 plasma5 $pkgdir/usr/share/plasma/desktoptheme
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/kde-gruvbox-git/LICENSE
}
