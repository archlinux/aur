# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=nvim-r
pkgver=0.9.16
pkgrel=1
pkgdesc="Vim plugin to work with R"
arch=('any')
url="https://github.com/jalvesaq/${pkgname}"
license=('GPL2')
optdepends=('vim>=8.1.1705: either vim or neovim'
            'tmux>=2.0: if using vim and running R in an external terminal emulator, necessary for sending commands to R'
            'neovim>=0.4.3: either neovim or vim'
            'r>=3.0.0: for integration with R'
	    'pandoc: render output from markup files'
            'vim-csv: inspect data.frames and matrices')
conflicts=('vim-r' 'r-vimcom')
replaces=('vim-r')
install='nvim-r.install'
source=("$pkgname-$pkgver.tar.gz::https://github.com/jalvesaq/Nvim-R/archive/v${pkgver}.tar.gz")
sha256sums=('52ce6a161cfc17b0a9ade43831e5246a37d1cd29d4c63f101113e5fa4c02bcee')

package() {
  cd "Nvim-R-${pkgver}"
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p "${_installpath}"
  cp -r {R,doc,ftdetect,ftplugin,syntax} "${_installpath}"
}
