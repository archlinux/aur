# Maintainer: you-oopsdev <itachi522ru@gmail.com>
_pkgname=vim-m3u-syntax
pkgname=vim-m3u
pkgver=1
pkgrel=2
groups=('vim-plugins' 'neovim-plugins')
pkgdesc="Syntax description file for m3u file format in vim/neovim"
arch=('any')
url='https://github.com/FauveNoir/vim-m3u-syntax'
license=('MIT')
#depends=('vim' 'neovim')
optdepends=('vim: vim support'
            'neovim: neovim support')
makedepends=('git')
source=("git+${url}.git"
        "m3u.vim")
sha256sums=('SKIP'
            '89090647ed4df4b72d3c74dc21c1242e820d79df6636260f6998b0437d576fc5')

prepare() {
cd "$srcdir/$_pkgname/"
}

package() {
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles/syntax" \
                  "$pkgdir/usr/share/vim/vimfiles/ftdetect"
# Neovim can load plugin directory vim's
  install -Dm 644 "$srcdir/$_pkgname/m3u.vim" "$pkgdir/usr/share/vim/vimfiles/syntax/"
  install -Dm 644 "$srcdir/m3u.vim" "$pkgdir/usr/share/vim/vimfiles/ftdetect"
}
