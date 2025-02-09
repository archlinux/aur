# Maintainer: you-oopsdev <itachi522ru@gmail.com>
# Thanks to thestinger and Almageste for the PKGBUILD sample
_scriptid=8719
pkgname=vim-pac
pkgver=0.1
pkgrel=2
groups=('vim-plugins' 'neovim-plugins')
pkgdesc="Syntax description file for PAC file format in vim/neovim"
arch=('any')
url='https://www.vim.org/scripts/script.php?script_id=2249'
license=('Unknown')
#depends=('vim' 'neovim')
optdepends=('vim: vim support'
            'neovim: neovim support')
source=("pac.vim::https://www.vim.org/scripts/download_script.php?src_id=$_scriptid"
        "pac.ft")

sha256sums=('da679ccae369b205e565052bdff3c5bf0efc21a07d619946744a1bd03fc6ca8a'
            '341c3c1c41eba8d3f9c1b189cdbbcc49c382f9af6e47699497da6d53a9c5a55e')
package() {
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles/syntax" \
                  "$pkgdir/usr/share/vim/vimfiles/ftdetect"
# Neovim can load plugin directory vim's
  install -Dm 644 "$srcdir/pac.vim" "$pkgdir/usr/share/vim/vimfiles/syntax/"
  install -Dm 644 "$srcdir/pac.ft" "$pkgdir/usr/share/vim/vimfiles/ftdetect/pac.vim"
}
