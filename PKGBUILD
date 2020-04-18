# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vim-bracketed-paste-git
pkgver=r38.c4c639f3ca
pkgrel=1
pkgdesc='Vim plugin to handle bracketed-paste-mode (aka. automatic `:set paste`)'
arch=('any')
LICENSE=('MIT')
url='https://github.com/conradirwin/vim-bracketed-paste'
source=("git+$url")
sha256sums=('SKIP')
provides=(vim-bracketed-paste)
conflicts=(vim-bracketed-paste)

pkgver() {
  cd vim-bracketed-paste
  printf 'r%d.%s' \
    $(git rev-list --count HEAD) \
    $(git rev-parse HEAD | head -c10)
}

package() {
  install -Dm644 vim-bracketed-paste/plugin/bracketed-paste.vim \
    "$pkgdir"/usr/share/vim/vimfiles/plugin/bracketed-paste.vim
}
