# Maintainer: Paul Clark <paul500clark at gmail dot com>
pkgname=emacs-xterm-color
_pkgname=xterm-color
pkgver=2.0
pkgrel=1
pkgdesc="Emacs ANSI control sequence to text-property translator"
arch=('any')
url="https://github.com/atomontage/xterm-color"
license=('GPL')
makedepends=('emacs')
source=($pkgname-$pkgver.tar.gz::https://github.com/atomontage/${_pkgname}/archive/${pkgver}.tar.gz)
md5sums=('03e29aeb5f2296736ae619b577c57219')


package() {
  cd ${_pkgname}-${pkgver}
  emacs -Q -batch -f batch-byte-compile xterm-color.el
  install -d "${pkgdir}/usr/share/emacs/site-lisp"
  install -D -m644 xterm-color.el xterm-color.elc "$pkgdir/usr/share/emacs/site-lisp"
}

# vim:set ts=2 sw=2 et:
