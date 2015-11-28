# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Michael Pusterhofer <pusterhofer at student dot tugraz dot at>

pkgname=vim-r
pkgver=1.2.7
pkgrel=1
pkgdesc="Improves Vim's support for editing R code and integrates Vim with R"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2628"
license=('unknown')
depends=('vim' 'tmux')
optdepends=('pandoc: render output from markup files'
            'vim-csv: inspect data.frames and matrices')
install=('vim-r.install')
source=("${pkgname}-${pkgver}.vmb::http://www.vim.org/scripts/download_script.php?src_id=23760")
md5sums=('ae8386f2b3941e8565f8b5b7b7038ee3')

package() {
  mkdir -p "${pkgdir}/usr/share/vim/vimfiles"
  vim -c "UseVimball ${pkgdir}/usr/share/vim/vimfiles" -c q \
    "${srcdir}/${pkgname}-${pkgver}.vmb"
  rm "${pkgdir}/usr/share/vim/vimfiles/.VimballRecord"
  rm "${pkgdir}/usr/share/vim/vimfiles/doc/tags"
}
