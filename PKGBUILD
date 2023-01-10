pkgname=vim-flake8
pkgver=1.7
pkgrel=0
pkgdesc='Flake8 plugin for Vim'
arch=('any')
license=('BSD 2-Clause')
url='https://github.com/nvie/vim-flake8'
depends=('vim>=8' 'flake8')
groups=('vim-plugins')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=("a4208478f9754ef2d188a51e3262c449ef16b48fc0208425795d71c304118c129ae20a723fff96863291bae66237f1479a591cc23e5ec90222e0614d2dcccce9")

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  local _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -D -m644 ftplugin/python_flake8.vim \
  ${_installpath}/ftplugin/python/python_flake8.vim
  install -D -m644 autoload/flake8.vim \
  ${_installpath}/autoload/flake8.vim 
}
