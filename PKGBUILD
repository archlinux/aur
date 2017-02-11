# Maintainer: Olivier Galibert <galibert@pobox.com>
# Contributor: Philip Mueller <mail at philip.in-aachen dot net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-yaml-mode
pkgver=0.0.13
pkgrel=2
pkgdesc="Emacs major mode for editing files in the YAML data serialization format"
arch=('any')
url="https://github.com/yoshiki/yaml-mode"
license=('GPL')
depends=('emacs')
install=emacs-yaml-mode.install
source=("$pkgname-$pkgver.taz.gz::https://github.com/yoshiki/${pkgname#emacs-}/archive/v$pkgver.tar.gz")
md5sums=('22a94319ba03a94578dfdfae11f8b5ae')

build() {
  cd ${pkgname#emacs-}-$pkgver
  emacs -batch -q -f batch-byte-compile ${pkgname#emacs-}.el
}

package() {
  cd ${pkgname#emacs-}-$pkgver
  # Install the mode for Emacs
  install -D -m644 ${pkgname#emacs-}.el $pkgdir/usr/share/emacs/site-lisp/${pkgname#emacs-}.el
  install -D -m644 ${pkgname#emacs-}.elc $pkgdir/usr/share/emacs/site-lisp/${pkgname#emacs-}.elc
}
