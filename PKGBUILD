# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=neovim-vcscommand
pkgver=1.99.47
_scriptid=19809
pkgrel=1
pkgdesc="Neovim version control system integration plugin"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=90"
license=('MIT')
depends=('neovim')
groups=('neovim-plugins')
replaces=('neovim-vsccommand') #whoops, typo before
install=nvim-doc.install
source=('vcscommand.zip::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid')

sha256sums=('1d3c451df38110c2c5a9ce977978449d29497ee36576a4ac454a0a4c5f6ddb4b')

package() {
  cd ${srcdir}

  installpath="${pkgdir}/usr/share/nvim/runtime"
  mkdir -p $installpath
  cp -r --no-preserve=owner doc plugin syntax $installpath

  #just in case....
  find "$installpath" -type f -exec chmod 644 {} \;

}
# vim: sw=2 ts=2 et:
