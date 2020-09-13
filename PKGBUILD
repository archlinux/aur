# Maintainer: la Fleur <lafleur at boum dot org>

pkgname=vim-gtk-recent
_pkgname=${pkgname}-git
pkgver=r1
pkgrel=1
pkgdesc="logs files opened in vim into GObject recent files"
arch=('i686' 'x86_64')
url="https://gitlab.gnome.org/lafleurdeboum/vim-gtk-recent"
license=('GPLv3')
depends=('vim' 'python-gobject')
provides=(${_pkgname})
conflicts=(${_pkgname})
groups=('vim-plugins')
source=("$pkgname"::'git://github.com/lafleurdeboum/vim-gtk-recent.git')
md5sums=('SKIP')
#source=("gtk-recent.vim")
#sha256sums=("0bfd12821e362731d2175b92c87a5f55cc122d82bec8e534efa183f380aa2009")

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  local _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -d "${_installpath}/plugin"

  cd "$srcdir"
  install -D -m644 "${pkgdir}/gtk-recent.vim" "${_installpath}/plugin/"

  #cd "$pkgname"
  #cp -r -t "${_installpath}" indent syntax syntax_checkers UltiSnips
}

