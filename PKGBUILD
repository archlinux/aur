# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-fortran
pkgver=0.4
_filename=fortran_${pkgver}.vim
_srcid=15717
_scriptid=2299
pkgrel=2
pkgdesc="Additional indentation rules for Fortran 95 and Fortran 90"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=${_scriptid}"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=(${_filename}::http://www.vim.org/scripts/download_script.php?src_id=${_srcid})
sha256sums=('d3c67714ed9248397b513366126e1dc61f6bd2081c96849a8ea5f0a0282662f9')

prepare(){
  cd "${srcdir}"

  #Fix some encoding stuffs
  iconv -f ISO_8859-16 -t UTF8 ${_filename} > ${_filename}.new
  tr -d '\015' < ${_filename}.new > ${_filename}.new.new
}

package(){
  install -Dm755 "${srcdir}/${_filename}.new.new"\
    "${pkgdir}/usr/share/vim/vimfiles/after/indent/fortran.vim"
}
