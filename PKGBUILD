# Maintainer: lmartinez-mirror
pkgname=vim-wpgtk-git
pkgver=r16.84735c3
pkgrel=2
pkgdesc="Vim colorscheme for wpgtk"
arch=('any')
url="https://github.com/deviantfero/wpgtk.vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
optdepends=('vim-airline'
            'vim-lightline-git'
            'neovim-airline'
            'neovim-lightline')
makedepends=('git')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  find autoload colors -type f -exec install -Dm644 '{}' \
    "$pkgdir/usr/share/vim/vimfiles/{}" \;
}

