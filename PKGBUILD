# Maintainer: Hezekiah Michael < spiritomb at protonmail dot com>

pkgname=neovim-colors-brogrammer-git
pkgver=r4.8aa391d
pkgrel=1
pkgdesc="A dark, colorful syntax highlighting theme."
arch=('any')
url="https://github.com/marciomazza/vim-brogrammer-theme"
license=('unknown')
makedepends=('git')
depends=('neovim')
source=("$pkgname::git+https://github.com/marciomazza/vim-brogrammer-theme.git")
sha256sums=('SKIP')

pkgver() {
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    find colors \
            -type f \
            -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
