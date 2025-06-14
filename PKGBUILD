# Contributor: Daniel Greve <greve.daniel.l at gmail dot com>

pkgname=neovim-drop-in
pkgver=1
pkgrel=2
pkgdesc='Replace vim and vi with neovim (umnaintained)'
arch=('any')
url='https://neovim.io'
license=(LicenseRef-vim)
depends=(neovim-symlinks)
optdepends=('xxd: Edit binary files')
provides=(vim-runtime)
conflicts=(gvim)
install=neovim-drop-in.install

## To do: Provide vimtutor
package() {
  echo Please switch to neovim-symlinks.
  echo ${pkgname} is unmaintained currently.
  echo Please send a deletion request for ${pkgname} if every features of it are broken.

  echo -e '#!/bin/sh\nexec /usr/bin/nvim -E "$@"' \
    | install -Dm755 /dev/stdin "${pkgdir}/usr/bin/exim"
  install -d "${pkgdir}/usr/share/man/man1"
  for _m in vi vim vimdiff; do
    ln -sf nvim.1.gz "${pkgdir}/usr/share/man/man1/${_m}.1.gz"
  done
}
