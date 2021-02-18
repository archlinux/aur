# Maintainer: lmartinez-mirror
pkgname=vim-delimitmate-git
pkgver=2.7.r34.g537a1da
pkgrel=1
pkgdesc="A vim plugin providing insert mode autocompletion for quotes, brackets, etc."
arch=('any')
url="https://github.com/raimondi/delimitmate"
license=('vim-license')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=('vim-delimitmate')
conflicts=('neovim-delimitmate')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  find autoload doc plugin -type f -exec install -Dm 644 '{}' \
    "$pkgdir/usr/share/vim/vimfiles/{}" \;
}

