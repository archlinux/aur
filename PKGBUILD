# Maintainer: Cedric Girard <girard.cedric@gmail.com>

pkgname=vim-logstash-git
pkgver=r11.6d96810
pkgrel=1
pkgdesc='Vim highlights configuration files for logstash'
arch=('any')
url='https://github.com/robbles/logstash.vim'
license=('MIT')
depends=('vim')
source=("vim-logstash::git+https://github.com/robbles/logstash.vim.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/vim-logstash
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
  cd "$srcdir"/vim-logstash
  local installpath="$pkgdir/usr/share/vim/vimfiles"
  install -Dm644 ftdetect/logstash.vim "$installpath/ftdetect/logstash.vim"
  install -Dm644 syntax/logstash.vim "$installpath/syntax/logstash.vim"
}

# vim:set ts=2 sw=2 et:
