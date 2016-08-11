# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=nvim-r
pkgver=0.9.6
pkgrel=1
pkgdesc="Vim plugin to work with R"
arch=('any')
url="https://github.com/jalvesaq/${pkgname}"
license=('GPL2')
optdepends=('vim>=7.4.1829: either vim or neovim'
            'tmux: if using vim, necessary for sending commands to R'
            'neovim>=0.1.4: either neovim or vim'
	    'pandoc: render output from markup files'
            'vim-csv: inspect data.frames and matrices')
conflicts=('vim-r' 'r-vimcom')
replaces=('vim-r')
install='nvim-r.install'
source=("https://github.com/jalvesaq/Nvim-R/archive/v${pkgver}.tar.gz")
sha256sums=('8507a207db21f02aee96d6717229a7cc6e701ca5358a9ca6730b9af2fca4038f')

package() {
  cd "Nvim-R-${pkgver}"
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p "${_installpath}"
  cp -r {R,doc,ftdetect,ftplugin,syntax} "${_installpath}"
}
