# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=nvim-r
pkgver=0.9.20
pkgrel=1
pkgdesc="Vim plugin to work with R"
arch=('any')
url="https://github.com/jalvesaq/${pkgname}"
license=('GPL2')
optdepends=('vim>=8.2.84: either vim or neovim'
            'tmux>=2.0: if using vim and running R in an external terminal emulator, necessary for sending commands to R'
            'neovim>=0.6.0: either neovim or vim'
            'r>=3.0.0: for integration with R'
	    'pandoc: render output from markup files'
            'vim-csv: inspect data.frames and matrices')
conflicts=('vim-r' 'r-vimcom')
replaces=('vim-r')
install='nvim-r.install'
source=("$pkgname-$pkgver.tar.gz::https://github.com/jalvesaq/Nvim-R/archive/v${pkgver}.tar.gz")
sha256sums=('4c5daa6539cbe852bd77e3c29e67f1eb019937f22a09023599a6207d3115523a')

package() {
  cd "Nvim-R-${pkgver}"
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p "${_installpath}"
  cp -r {R,doc,ftdetect,ftplugin,syntax} "${_installpath}"
}
