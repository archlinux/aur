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
source=("$pkgname"::'git://gitlab.gnome.org/lafleur/vim-gtk-recent.git')
md5sums=('SKIP')

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

