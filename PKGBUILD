# Maintainer: yuki-san <yuki.from.akita@gmail.com>

pkgname=emacs-popup-el
pkgver=0.5.3
pkgrel=2
pkgdesc='A visual popup user interface library for Emacs'
arch=('any')
url="https://github.com/auto-complete/popup-el"
license=('GPL')
depends=('emacs')
makedepends=('emacs')
source=(${pkgname#emacs-}-${pkgver}.tar.gz::"https://github.com/auto-complete/popup-el/archive/v0.5.3.tar.gz")
md5sums=('7dedfb1b46cc2f88a7004391f3f5d314')

_elfile=popup

build() {
  cd "$srcdir/${pkgname#emacs-}-${pkgver}"
  emacs -q -batch -f batch-byte-compile "$_elfile".el
}

package() {
  cd "$srcdir/${pkgname#emacs-}-${pkgver}"
  install -d -m 755 "$pkgdir"/usr/share/emacs/site-lisp
  install -c -m 644 "$_elfile".el "$pkgdir"/usr/share/emacs/site-lisp
  install -c -m 644 "$_elfile".elc "$pkgdir"/usr/share/emacs/site-lisp

  install -d -m 755 "$pkgdir"/usr/share/doc/${pkgname}
  install -c -m 644 README.md "$pkgdir"/usr/share/doc/${pkgname}
}

# vim:set ts=2 sw=2 et:
