# Maintainer: Aaron Schaefer <aaron@elasticdog.com>

pkgname=vim-pastie
pkgver=2.0
_scriptid=10260
pkgrel=10
pkgdesc='A Vim plugin that lets you read and create pastes at http://pastie.org/'
arch=('any')
url='https://www.vim.org/scripts/script.php?script_id=1624'
license=('custom:vim')
depends=('ruby' 'vim')
groups=('vim-plugins')
source=("https://www.vim.org/scripts/download_script.php?src_id=$_scriptid" license.txt)
sha256sums=('a0b510431c29e600233c4a7d6a77ad7380d37dcfe862d42811f8258046fba94d'
            '446c67d93c43addf076fe103a71844c2d875d478f82186436567dd221f2652f3')

package() {
  cd "$srcdir"
  local installpath="$pkgdir/usr/share/vim/vimfiles"

  install -D -m644 "download_script.php?src_id=$_scriptid" "$installpath/plugin/pastie.vim"
  install -D -m644 "license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
