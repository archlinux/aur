# Maintainer: Paul Clark <paul500clark at gmail dot com>
pkgname=emacs-eterm-256color
_pkgname=eterm-256color
pkgver=0.3.13
pkgrel=1
pkgdesc="Customizable 256 colors for emacs term and ansi-term"
arch=('any')
url="https://github.com/atomontage/eterm-256color"
license=('GPL')
depends=('emacs-xterm-color' 'emacs-f')
makedepends=('emacs' 'ncurses')
source=($pkgname-$pkgver.tar.gz::https://github.com/dieggsy/${_pkgname}/archive/${pkgver}.tar.gz)
md5sums=('629f112e52d32bd7bcfc8de741025fa1')


package() {
  cd ${_pkgname}-${pkgver}
  emacs -q -batch -f batch-byte-compile eterm-256color.el
  install -d "$pkgdir/usr/share/emacs/site-lisp"
  install -D -m644 eterm-256color.el eterm-256color.elc "$pkgdir/usr/share/emacs/site-lisp"
  install -d "$pkgdir/usr/share/terminfo"
  tic -o "$pkgdir/usr/share/terminfo" eterm-256color.ti
}

# vim:set ts=2 sw=2 et:
