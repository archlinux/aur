# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Michael Pusterhofer <pusterhofer at student dot tugraz dot at>

pkgname=vim-r
pkgver=1.3.0
pkgrel=1
pkgdesc="Improves Vim's support for editing R code and integrates Vim with R"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2628"
license=('unknown')
depends=('vim' 'r-vimcom=1.3' 'tmux')
optdepends=('pandoc: render output from markup files'
            'vim-csv: inspect data.frames and matrices')
source=("${pkgname}-${pkgver}.vmb::http://www.vim.org/scripts/download_script.php?src_id=24092")
sha256sums=('5ae9d50a740b74739c46487aa577da251488655fd552bd0146bb5aba3071803d')

package() {
  mkdir -p "${pkgdir}/usr/share/vim/vimfiles"
  vim -c "UseVimball ${pkgdir}/usr/share/vim/vimfiles" -c q \
    "${srcdir}/${pkgname}-${pkgver}.vmb"
  rm "${pkgdir}/usr/share/vim/vimfiles/.VimballRecord"
  rm "${pkgdir}/usr/share/vim/vimfiles/doc/tags"
}
