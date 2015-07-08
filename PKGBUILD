# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>

pkgname=tmuxline-git
pkgver=r41.725a511
pkgrel=1
pkgdesc="Simple tmux statusline generator with support for powerline symbols and airline integration."
arch=('any')
url="https://github.com/edkolev/tmuxline.vim"
license=('MIT')
depends=('tmux' 'vim')
makedepends=('git')
install=$pkgname.install
source=("$pkgname"::'git://github.com/edkolev/tmuxline.vim.git')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm644 plugin/tmuxline.vim \
    "$pkgdir/usr/share/vim/vimfiles/plugin/tmuxline.vim"
  install -Dm644 doc/tmuxline.txt \
    "$pkgdir/usr/share/vim/vimfiles/doc/tmuxline.txt"

  find autoload* -type f -exec install -Dm644 '{}' \
    "$pkgdir/usr/share/vim/vimfiles/{}" \;

  install -Dm644 LICENSE  "$pkgdir/usr/share/licenses/tmuxline/LICENSE"
}

# vim:set ts=2 sw=2 et:
