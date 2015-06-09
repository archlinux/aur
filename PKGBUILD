# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-fortran
_filename=fortran.vim
pkgver=0.4
_scriptid=15717
pkgrel=1
pkgdesc="Additional indentation rules for Fortran 95 and Fortran 90"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2299"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
md5sums=('2dd6ae6ff44facee2f673b898482679b')

prepare(){
  cd $srcdir

  #Fix some encoding stuffs
  iconv -f ISO_8859-16 -t UTF8 $pkgname > ${_filename}.bak
  tr -d '\015' < ${_filename}.bak > ${_filename}
  rm ${_filename}.bak
}

package(){
  install -Dm755 ${srcdir}/${_filename} ${pkgdir}/usr/share/vim/vimfiles/after/indent/$_filename
}
