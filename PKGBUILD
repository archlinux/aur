# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>

pkgname=vim-bufferline-git
pkgver=r42.1788138
pkgrel=1
pkgdesc="Super simple plugin to show the list of buffers in the command bar."
arch=('any')
url="https://github.com/bling/vim-bufferline"
license=('MIT')
depends=('vim')
makedepends=('git')
install=$pkgname.install
source=("$pkgname"::'git://github.com/bling/vim-bufferline.git')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm644 plugin/bufferline.vim \
    "$pkgdir/usr/share/vim/vimfiles/plugin/bufferline.vim"
  install -Dm644 doc/bufferline.txt \
    "$pkgdir/usr/share/vim/vimfiles/doc/bufferline.txt"

  find autoload* -type f -exec install -Dm644 '{}' \
    "$pkgdir/usr/share/vim/vimfiles/{}" \;

  install -Dm644 LICENSE  "$pkgdir/usr/share/licenses/vim-bufferline/LICENSE"
}

# vim:set ts=2 sw=2 et:
