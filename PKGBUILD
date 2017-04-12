# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vim-khr
pkgver=4.86b52f8
pkgrel=1
pkgdesc='Vim syntax highlighting for Khronos extension specification documents'
arch=('any')
url='https://github.com/kbenzie/vim-khr'
source=("git+$url")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/vim-khr"
  printf '%d.%s' \
    $(git rev-list --count HEAD) \
    $(git rev-parse --short HEAD)
}

package() {
  for folder in ftplugin syntax
  do
    install -Dm644 "${srcdir}/vim-khr/${folder}/khr.vim" \
      "${pkgdir}/usr/share/vim/vimfiles/${folder}/khr.vim"
  done
}
