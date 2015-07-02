# Maintainer: 3ED <krzysztof1987 _at_ gmail _dot_ com>

pkgname=vim-bash-support
pkgver=4.2.1
_srcid=21804
pkgrel=1
pkgdesc='BASH-IDE - Write and run BASH-scripts using menus and hotkeys. '
arch=('any')
url='http://vim.sourceforge.net/scripts/script.php?script_id=365'
license=('custom:vim')
depends=('vim-vim-support')
optdepends=('bashdb: bash debugger')
install='vimdoc.install'
source=("${pkgname}-${pkgver}.zip::http://www.vim.org/scripts/download_script.php?src_id=$_srcid")
noextract=("${pkgname}-${pkgver}.zip")
sha256sums=('67aab863783dd72ba9a963b3e2c0e1754cd93795cf661fdeb5e699b1b3841742')

package() {
  _DESTDIR="$pkgdir"/usr/share/vim/vimfiles

  install -dm755 "${_DESTDIR}"
  bsdtar -xf ${pkgname}-${pkgver}.zip -C "${_DESTDIR}" \
    --exclude "autoload/mmtemplates/core.vim" \
    --exclude "doc/templatesupport.txt" \
    --exclude "syntax/template.vim"

  # Fix perms
  chmod -R a=r,a+X,u+w "${_DESTDIR}"
}
