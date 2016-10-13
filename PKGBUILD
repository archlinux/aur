# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=neovim-project
pkgver=1.4.1
_scriptid=6273
pkgrel=1
pkgdesc="Organize and navigate projects of files (like an ide/buffer explorer)"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=69"
license=('custom')
depends=('neovim')
groups=('neovim-plugins')
install=nvim-doc.install
source=("$pkgname.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid"
        'LICENSE')
sha256sums=('6e0c60cb2782d8232182124b0b617fdb6f1e1fcf0259273ce717940976d0b097'
            'e5cf201d8687c2b7752dc10a24810ec29f7bec1dfab0b3f03cde3e9909cddc0f')

package() {
  cd ${srcdir}

  installpath="${pkgdir}/usr/share/nvim/runtime"

  install -D -m644 doc/project.txt \
    $installpath/doc/project.txt
  install -D -m644 plugin/project.vim \
    $installpath/plugin/project.vim
  install -D -m644 LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
# vim: set ts=2 sw=2 et:
