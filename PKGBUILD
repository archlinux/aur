# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vim-quickscope-git
pkgver=2.5.10+0.gd4c02b85ff
pkgrel=1
pkgdesc='Highlight which characters to target for f, F and family'
arch=('any')
license=('MIT')
url='https://github.com/unblevable/quick-scope'
source=("git+$url")
sha256sums=('SKIP')
groups=('vim-plugins')
provides=(vim-quickscope=${pkgver%%+*})
conflicts=(vim-quickscope)

pkgver() {
  cd quick-scope
  git describe --long --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
}

package() {
  install -Dm644 quick-scope/autoload/quick_scope.vim "$pkgdir/usr/share/vim/vimfiles/autoload/quick_scope.vim"
  install -Dm644 quick-scope/autoload/quick_scope/mapping.vim "$pkgdir/usr/share/vim/vimfiles/autoload/quick_scope/mapping.vim"
  install -Dm644 quick-scope/autoload/quick_scope/lazy_print.vim "$pkgdir/usr/share/vim/vimfiles/autoload/quick_scope/lazy_print.vim"
  install -Dm644 quick-scope/plugin/quick_scope.vim "$pkgdir/usr/share/vim/vimfiles/plugin/quick_scope.vim"
  install -Dm644 quick-scope/doc/quick-scope.txt "$pkgdir/usr/share/vim/vimfiles/doc/quick-scope.txt"
}
