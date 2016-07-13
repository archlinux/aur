# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Adam Russell <adamlr6+arch@gmail.com>
pkgname=vim-pep8
pkgver=1.1
pkgrel=1
pkgdesc="A PEP 8 Python source file checker for Vim"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2914"
license=('unknown')
depends=('vim' 'python-pycodestyle')
groups=('vim-plugins')
source=("https://github.com/nvie/vim-pep8/archive/${pkgver}.tar.gz")
md5sums=('7b36dd34665495110a8627131e83a730')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  sed -i -e 's/s:pep8_cmd="pep8"/s:pep8_cmd="pycodestyle"/g' \
    "ftplugin/python_pep8.vim"

}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  local _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -D -m644 ftplugin/python_pep8.vim \
  ${_installpath}/ftplugin/python/python_pep8.vim
}
# vim:set ts=2 sw=2 et:
