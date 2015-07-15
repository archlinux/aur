_pkgname=vim-pandoc-syntax
pkgname=vim-pandoc-syntax-git
pkgver=1434938917
pkgrel=1
pkgdesc="syntax plugin for Pandoc's extended markdown"
arch=('any')
url='https://github.com/vim-pandoc/vim-pandoc-syntax'
license=('unknown')
depends=('vim')
makedepends=('git')
provides=('vim-pandoc-syntax')
conflicts=('vim-pandoc-syntax')

source=('git://github.com/vim-pandoc/vim-pandoc-syntax.git')
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
