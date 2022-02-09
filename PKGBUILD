# Maintainer: Amos Onn <amosonn@gmail.com>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: lolilolicon <lolilolicon_at_gmail_dot_com>

pkgname=vim-simpylfold
_pkgname=SimpylFold
pkgver=2.0
pkgrel=1
pkgdesc='Vim plugin providing simple, correct folding for Python'
arch=('any')
url='https://github.com/tmhedberg/SimpylFold'
license=('custom')
depends=('vim>=7.3')
groups=('vim-plugins')
install=vimdoc.install
source=("https://codeload.github.com/tmhedberg/$_pkgname/tar.gz/v$pkgver")
sha512sums=('65cc7ab7ed3de03bf7eccfabd309d16a6f0cfca7651283be172f47b4160a20d1322c152e80354cfac35c13063315f60a39c3207d2d6b4246a8e804bad1c0e6ff')

package() {
  cd "$_pkgname-$pkgver"
  local _vimdir="$pkgdir/usr/share/vim/vimfiles"
  install -D -m644 {,"$_vimdir/"}"autoload/SimpylFold.vim"
  install -D -m644 {,"$_vimdir/"}"doc/SimpylFold.txt"
  install -D -m644 {,"$_vimdir/"}"ftplugin/python/SimpylFold.vim"
  ln -s cpython "$_vimdir/ftplugin/python"
  install -D -m644 {,"$_vimdir/"}"plugin/SimpylFold.vim"
  install -D -m644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}"
}
