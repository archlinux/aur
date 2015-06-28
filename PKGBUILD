# Maintainer: Petteri Tolonen <petteri dot tolonen at gmail dot com>

pkgname=vimchant
pkgver=1.1
_scriptid=9199
pkgrel=2
pkgdesc="Fast on-the-fly spell-checker based on Enchant for vim"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2345"
license=('custom: Public domain')
depends=('vim>=7.1.040')
install=vimchant.install
source=("vimchant.vba::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid")
sha256sums=('856f0a66efb7ab1a7b1cbd35a47baa0f2e0312173a0baf84b651da21d3483fc2')

package() {
  install -dm755 "${pkgdir}/usr/share/vim/vimfiles"
  cd "${pkgdir}/usr/share/vim/vimfiles"

  /usr/bin/vim -n -i NONE -c ":UseVimball `pwd`" -c ":q" $srcdir/$pkgname.vba
  rm -f '.VimballRecord' 'doc/tags'
}

