# Maintainer: Your Name <youremail@domain.com>
_pkgname=kitty-gruvbox-theme
pkgname="${_pkgname}"-git
pkgver=r12.833d137
pkgrel=1
pkgdesc="Gruvbox theme for kitty terminal."
arch=(any)
url="https://github.com/wdomitrz/kitty-gruvbox-theme"
license=('MIT')
depends=(kitty)
makedepends=(git)
provides=(kitty-gruvbox-theme)
conflicts=(kitty-gruvbox-theme)
install="install.install"
source=("git+https://github.com/wdomitrz/kitty-gruvbox-theme.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"
    install -dm755 $pkgdir/usr/share/kitty/themes/gruvbox
    cp gruvbox_* $pkgdir/usr/share/kitty/themes/gruvbox
    chmod 755 $pkgdir/usr/share/kitty/themes/gruvbox/gruvbox_*
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname
}
