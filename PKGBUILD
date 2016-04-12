# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: olantwin <olantwin@gmail.com>

pkgname=vim-airline
pkgver=0.8
pkgrel=2
pkgdesc='Lean & mean statusline/tabline for ViM'
arch=('any')
url='https://github.com/vim-airline/vim-airline'
license=('MIT')
depends=('vim-runtime' 'vim-airline-themes')
makedepends=('git')
groups=('vim-plugins')
#optdepends=('otf-powerline-symbols-git: Use the Powerline symbols')
install='vimdoc.install'
source=("git://github.com/vim-airline/$pkgname.git#tag=v$pkgver")
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

  # This one conflicts with vim-airline-themes
  rm "$pkgdir/usr/share/vim/vimfiles/autoload/airline/themes/dark.vim"
}

# getver: raw.githubusercontent.com/vim-airline/vim-airline/master/CHANGELOG.md
# vim:set ts=2 sw=2 et:
