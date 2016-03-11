# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Michael Pusterhofer <pusterhofer at student dot tugraz dot at>

pkgname=vim-r
pkgver=1.2.9
pkgrel=1
pkgdesc="Improves Vim's support for editing R code and integrates Vim with R"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2628"
license=('unknown')
depends=('vim' 'r-vimcom=1.2_9' 'tmux')
optdepends=('pandoc: render output from markup files'
            'vim-csv: inspect data.frames and matrices')
source=("${pkgname}-${pkgver}.vmb::http://www.vim.org/scripts/download_script.php?src_id=24089")
sha256sums=('0d8912456bb7544c9f48206813ab7a2d6d7dc97863d3e2066ebdfe40edd2a52c')

package() {
  mkdir -p "${pkgdir}/usr/share/vim/vimfiles"
  vim -c "UseVimball ${pkgdir}/usr/share/vim/vimfiles" -c q \
    "${srcdir}/${pkgname}-${pkgver}.vmb"
  rm "${pkgdir}/usr/share/vim/vimfiles/.VimballRecord"
  rm "${pkgdir}/usr/share/vim/vimfiles/doc/tags"
}
