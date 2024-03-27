# Maintainer: janezz55
pkgname=vim-colors-night-git
pkgver=1
pkgrel=2
pkgdesc='night color schemes for vim (catppuccin, moonfly, nightfly, nightfox, night-owl, one, onehalfdark, palenight)'
arch=('any')
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
source=("$pkgsrc/catppuccin::git+https://github.com/catppuccin/vim.git"
        "$pkgsrc/moonfly::git+https://github.com/bluz71/vim-moonfly-colors.git"
        "$pkgsrc/nightfly::git+https://github.com/bluz71/vim-nightfly-colors"
        "$pkgsrc/nightfox::git+https://github.com/EdenEast/nightfox.nvim"
        "$pkgsrc/night-owl::git+https://github.com/haishanh/night-owl.vim.git"
        "$pkgsrc/palenight::git+https://github.com/drewtempelmeyer/palenight.vim.git"
        "$pkgsrc/one::git+https://github.com/rakr/vim-one.git"
        "$pkgsrc/onehalf::git+https://github.com/sonph/onehalf.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
  for dir in $(find $srcdir -maxdepth 1 -mindepth 1 -type d); do
    cd $dir
    [ -d vim ] && cd vim
    for dir in autoload colors lua; do
      [ -d $dir ] && find $dir -type f -exec install -Dm 644 '{}' \
      "$pkgdir/usr/share/vim/vimfiles/{}" \;
    done
    cd ..
  done
}
