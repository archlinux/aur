# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=nvim-r
pkgver=0.9.8
pkgrel=2
pkgdesc="Vim plugin to work with R"
arch=('any')
url="https://github.com/jalvesaq/${pkgname}"
license=('GPL2')
optdepends=('vim>=8.0.0: either vim or neovim'
            'tmux: if using vim, necessary for sending commands to R'
            'neovim>=0.1.7: either neovim or vim'
	    'pandoc: render output from markup files'
            'vim-csv: inspect data.frames and matrices')
conflicts=('vim-r' 'r-vimcom')
replaces=('vim-r')
install='nvim-r.install'
source=("https://github.com/jalvesaq/Nvim-R/archive/v${pkgver}.tar.gz")
sha256sums=('ceaebd2f725318cda029b2194b9ba01594db50755b1feb35b64782342c173520')

package() {
  cd "Nvim-R-${pkgver}"
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p "${_installpath}"
  cp -r {R,doc,ftdetect,ftplugin,syntax} "${_installpath}"
}
