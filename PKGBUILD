# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Michael Pusterhofer <pusterhofer at student dot tugraz dot at>

pkgname=vim-r
pkgver=1.3.1
pkgrel=1
pkgdesc="Improves Vim's support for editing R code and integrates Vim with R"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2628"
license=('unknown')
depends=('vim>=7.4.1529' 'r-vimcom=1.3_1' 'tmux')
optdepends=('pandoc: render output from markup files'
            'vim-csv: inspect data.frames and matrices')
source=("${pkgname}-${pkgver}.vmb::http://www.vim.org/scripts/download_script.php?src_id=24107")
sha256sums=('15b3aa763da16bdb90912546e08282e02ebdfb8ac8a89279136ccbd3c420d137')

package() {
  mkdir -p "${pkgdir}/usr/share/vim/vimfiles"
  vim -c "UseVimball ${pkgdir}/usr/share/vim/vimfiles" -c q \
    "${srcdir}/${pkgname}-${pkgver}.vmb"
  rm "${pkgdir}/usr/share/vim/vimfiles/.VimballRecord"
  rm "${pkgdir}/usr/share/vim/vimfiles/doc/tags"
}
