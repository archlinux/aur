# Maintainer: Alexander Rødseth <xyproto@archlinux.org>
# Contributor: olantwin <olantwin at gmail dot com>

pkgname=vim-airline
pkgver=0.7
pkgrel=2
pkgdesc='Lean & mean statusline/tabline for ViM'
arch=('any')
url='https://github.com/bling/vim-airline'
license=('MIT')
depends=('vim-runtime')
makedepends=('git')
#optdepends=('otf-powerline-symbols-git: Use the Powerline symbols')
install='vimdoc.install'
source=("git://github.com/bling/$pkgname.git#tag=v$pkgver")
md5sums=('SKIP')

package() {
  cd "$pkgname"

  _installpath="$pkgdir/usr/share/vim/vimfiles"
  install -Dm755 doc/airline.txt "$_installpath/doc/airline.txt"
  install -Dm755 plugin/airline.vim "$_installpath/plugin/airline.vim"
  install -d "$_installpath/autoload"
  install -d "$_installpath/t"
  cp -R autoload/* "$_installpath/autoload"
  cp -R t/* "$_installpath/t"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
