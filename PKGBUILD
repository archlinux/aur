_pkgname=vim-pandoc
pkgname=vim-pandoc-git
pkgver=1363054733
pkgrel=1
pkgdesc="plugin for writing and editing documents in Pandoc's extended markdown"
arch=('any')
#url='http://www.vim.org/scripts/script.php?script_id=3730'
url='https://github.com/vim-pandoc/vim-pandoc'
license=('unknown')
depends=('vim')

source=('git://github.com/vim-pandoc/vim-pandoc.git')
sha512sums=('SKIP')

pkgver() {
  cd -- "$srcdir/$_pkgname"
  git log -n1 --pretty=format:%ct
}

package() {
  cd "$srcdir/$_pkgname"
  install -dm755 "$pkgdir/usr/share/vim/vimfiles"
  find * -maxdepth 0 -type d -exec cp -R -t "$pkgdir/usr/share/vim/vimfiles" '{}' \+
}

