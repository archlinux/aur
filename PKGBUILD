# Maintainer: Hezekiah Michael < spiritomb at protonmail dot com>

pkgname=vim-colors-brogrammer-noguibg-git
pkgver=r40.5477768
pkgrel=1
pkgdesc="A dark, colorful syntax highlighting theme for vim. A fork that has no set gui background."
arch=('any')
url="https://github.com/kmalinich/vim-brogrammer-theme"
license=('unknown')
makedepends=('git')
depends=('vim')
conflicts=('vim-colors-brogrammer-git')
source=("$pkgname::git+https://github.com/kmalinich/vim-brogrammer-theme.git")
sha256sums=('SKIP')

pkgver() {
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"
    install -dm755 $pkgdir/usr/share/vim/vimfiles/colors
    install -Dm644 colors/* $pkgdir/usr/share/vim/vimfiles/colors/
}
