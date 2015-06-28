# Maintainer: Petteri Tolonen <petteri dot tolonen at gmail dot com>

pkgname=vimchant
pkgver=1.1
_scriptid=9199
pkgrel=1
pkgdesc="Fast on-the-fly spell-checker based on Enchant for vim"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2345"
license=('custom')
depends=('vim>=7.1.040')
install=vimchant.install
source=("vimchant.vba::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid")
md5sums=('e700eeb200ed0140c06b39c4ab3d082b')

build() {
  install -dm755 "${pkgdir}/usr/share/vim/vimfiles"
  cd "${pkgdir}/usr/share/vim/vimfiles"

  /usr/bin/vim -n -i NONE -c ":UseVimball `pwd`" -c ":q" $srcdir/$pkgname.vba
  rm -f '.VimballRecord' 'doc/tags'
}

