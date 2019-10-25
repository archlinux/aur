# Maintainer: Hezekiah Michael < spiritomb at protonmail dot com>

pkgname=vim-colors-brogrammer-git
pkgver=r1.7168656
pkgrel=1
pkgdesc="A dark, colorful syntax highlighting theme for vim."
arch=('any')
url="https://github.com/ErikBoesen/vim-brogrammer-theme"
license=('unknown')
makedepends=('git')
depends=('vim')
source=("$pkgname::git://github.com/ErikBoesen/vim-brogrammer-theme.git")
sha256sums=('SKIP')

pkgver() {
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"
    install -dm755 $pkgdir/usr/share/vim/vimfiles/colors
    install -Dm644 colors/* $pkgdir/usr/share/vim/vimfiles/colors/
}
