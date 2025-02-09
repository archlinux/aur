# Maintainer: you-oopsdev <itachi522ru@gmail.com>
# Thanks to thestinger and Almageste for the PKGBUILD sample
_scriptid=20736
pkgname=vim-httplog
pkgver=0.5
pkgrel=3
groups=('vim-plugins' 'neovim-plugins')
pkgdesc="Highlight access log of Apache, nginx, etc for vim/neovim"
arch=('any')
url='https://www.vim.org/scripts/script.php?script_id=3008'
license=('Unknown')
#depends=('vim' 'neovim')
optdepends=('vim: vim support'
            'neovim: neovim support')
source=("httplog.vim::https://www.vim.org/scripts/download_script.php?src_id=$_scriptid"
        "httplog.ft")
sha256sums=('fe5d759c491e1b249018836dd22b11672a6fb40ec6331dacf2e4ceb5c0bdebce'
            '30639fa0977b2b4d6a0dc016e9bb4fc14ebb82d08d67279fe781b76b1ed1d9d0')

package() {
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles/syntax" \
                  "$pkgdir/usr/share/vim/vimfiles/ftdetect"
# Neovim can load plugin directory vim's
  install -Dm 644 "$srcdir/httplog.vim" "$pkgdir/usr/share/vim/vimfiles/syntax/"
  install -Dm 644 "$srcdir/httplog.ft" "$pkgdir/usr/share/vim/vimfiles/ftdetect/httplog.vim"
}
