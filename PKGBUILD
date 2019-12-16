# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=vim-csv
pkgver=31
pkgrel=1
pkgdesc='csv.vim: a filetype plugin for csv files'
arch=('any')
url='https://www.vim.org/scripts/script.php?script_id=2830'
license=('unknown')
depends=('vim>=7.4')
groups=('vim-plugins')
source=("$pkgname-$pkgver.vmb::https://www.vim.org/scripts/download_script.php?src_id=22798")
sha256sums=('d26b789c71cbaf4dd6912363bbf4fad53c248080ad53a74cf49b3660dc4007e5')

package() {
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p "${_installpath}"
  vim -c "UseVimball ${_installpath}" -c q \
    "${srcdir}/${pkgname}-${pkgver}.vmb"
  rm "${_installpath}/.VimballRecord"
  rm "${_installpath}/doc/tags"
}
