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
sha512sums=("c29cfc00e4fd94128be02e003116647819cd3b39916527b70a7684c19ef4184bce1c1556051fc269bde4696a98b752fb7b4e081c2aac46cdcdfdf35735ec76b0")

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  local _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -D -m644 ftplugin/python_flake8.vim \
  ${_installpath}/ftplugin/python/python_flake8.vim
  install -D -m644 autoload/flake8.vim \
  ${_installpath}/autoload/flake8.vim 
}
