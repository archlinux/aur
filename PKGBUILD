# Maintainer: hiruocha <hiruocha[at]outlook[dot]com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Tomas Storck <storcktomas@gmail.com>
# Contributor: Tom Richards <tom@tomrichards.net>

pkgname=vim-compat
pkgver=1
pkgrel=1
pkgdesc='Replace vim in neovim'
arch=('any')
depends=('neovim' 'sh')
provides=('vim')
conflicts=('vim' 'neovim-symlinks')

package() {
  install -dm755 "$pkgdir/usr/bin/"
  cd "$pkgdir/usr/bin/"

  echo -e '#!/bin/sh\nexec nvim -d "$@"'  > vimdiff
  chmod 755 vimdiff

  ln -s nvim vim
}
