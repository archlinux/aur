# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=nvim-r
pkgver=0.9.5
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
source=("https://github.com/jalvesaq/Nvim-R/releases/download/v${pkgver}/Nvim-R.vmb")
sha256sums=('d9a69e297405851410441c4ebe84f8053d26bb6d5d8b01c4bcc054766e9d9e74')

package() {
  mkdir -p "${pkgdir}/usr/share/vim/vimfiles"
  vim -c "UseVimball ${pkgdir}/usr/share/vim/vimfiles" -c q \
    "${srcdir}/Nvim-R.vmb"
  rm "${pkgdir}/usr/share/vim/vimfiles/.VimballRecord"
  rm "${pkgdir}/usr/share/vim/vimfiles/doc/tags"
}
