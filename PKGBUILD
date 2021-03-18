# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-bash-completion
pkgver=3.1.0
pkgrel=1
pkgdesc="Add programmable bash completion to Emac's shell-mode"
url="https://github.com/szermatt/emacs-bash-completion"
arch=('any')
license=('GPL2')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/szermatt/emacs-bash-completion/archive/v${pkgver}.tar.gz")
sha256sums=('c01c8e01e777fce88013ce743ce76e70c584859f8dd28701dae809b1faa7b1d3')

build() {
  cd $pkgname-$pkgver
  emacs -Q -batch -L . -f batch-byte-compile bash-completion.el
}

package() {
  cd $pkgname-$pkgver
  install -d "${pkgdir}"/usr/share/emacs/site-lisp/bash-completion
  install -m644 bash-completion.el{c,} "${pkgdir}"/usr/share/emacs/site-lisp/bash-completion/
}
