# Maintainer: Aaron Schaefer <aaron@elasticdog.com>

pkgname=vim-pastie
pkgver=2.0
_scriptid=10260
pkgrel=11
pkgdesc='A Vim plugin that lets you read and create pastes at http://pastie.org/'
arch=('any')
url='https://www.vim.org/scripts/script.php?script_id=1624'
license=('custom:vim')
depends=('ruby' 'vim-plugin-runtime')
groups=('vim-plugins')
source=("https://www.vim.org/scripts/download_script.php?src_id=$_scriptid" license.txt)
sha256sums=('271836f473f6ccacdfb0d72a5c252370be92beb47a6580ee579e0fb96adbf14b'
            '446c67d93c43addf076fe103a71844c2d875d478f82186436567dd221f2652f3')

package() {
  cd "$srcdir"
  local installpath="$pkgdir/usr/share/vim/vimfiles"

  install -D -m644 "download_script.php?src_id=$_scriptid" "$installpath/plugin/pastie.vim"
  install -D -m644 "license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
