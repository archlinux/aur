# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-fortran
_filename=fortran.vim
pkgver=0.4
_scriptid=15717
pkgrel=2
pkgdesc="Additional indentation rules for Fortran 95 and Fortran 90"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2299"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=(${_filename}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
sha256sums=('d3c67714ed9248397b513366126e1dc61f6bd2081c96849a8ea5f0a0282662f9')

prepare(){
  cd "${srcdir}"

  #Fix some encoding stuffs
  iconv -f ISO_8859-16 -t UTF8 ${_filename} > ${_filename}.new
  tr -d '\015' < ${_filename}.new > ${_filename}.new.new
}

package(){
  install -Dm755 "${srcdir}/${_filename}.new.new"\
    "${pkgdir}/usr/share/vim/vimfiles/after/indent/${_filename}"
}
