# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=nvim-r
pkgver=0.9.3
pkgrel=3
pkgdesc="Vim plugin to work with R"
arch=('any')
url="https://github.com/jalvesaq/${pkgname}"
license=('GPL2')
optdepends=('vim>=7.4.1579: either vim or neovim'
            'tmux: if using vim, necessary for sending commands to R'
            'neovim: either neovim or vim'
	    'pandoc: render output from markup files'
            'vim-csv: inspect data.frames and matrices')
conflicts=('vim-r' 'r-vimcom')
replaces=('vim-r')
install='nvim-r.install'
source=("https://github.com/jalvesaq/Nvim-R/releases/download/v${pkgver}/Nvim-R.vmb")
sha256sums=('336acec73a4aede96cfc2974d7c7e95bccf8611208f7d9fac341cf3fa056b2cd')

package() {
  mkdir -p "${pkgdir}/usr/share/vim/vimfiles"
  vim -c "UseVimball ${pkgdir}/usr/share/vim/vimfiles" -c q \
    "${srcdir}/Nvim-R.vmb"
  rm "${pkgdir}/usr/share/vim/vimfiles/.VimballRecord"
  rm "${pkgdir}/usr/share/vim/vimfiles/doc/tags"
}
