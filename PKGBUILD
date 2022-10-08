# Maintainer: Hezekiah Michael < spiritomb at protonmail dot com>

pkgname=vim-colors-brogrammer-git
pkgver=r2.f6d0403
pkgrel=1
pkgdesc="A dark, colorful syntax highlighting theme for vim."
arch=('any')
url="https://github.com/marciomazza/vim-brogrammer-theme"
license=('unknown')
makedepends=('git')
depends=('vim')
source=("$pkgname::git+https://github.com/marciomazza/vim-brogrammer-theme.git")
sha256sums=('SKIP')

pkgver() {
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"
    install -dm755 $pkgdir/usr/share/vim/vimfiles/colors
    install -Dm644 colors/* $pkgdir/usr/share/vim/vimfiles/colors/
}
