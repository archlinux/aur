# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-bash-completion
pkgver=2.1.0
pkgrel=1
pkgdesc="Add programmable bash completion to Emac's shell-mode"
url="https://github.com/szermatt/emacs-bash-completion"
arch=('any')
license=('GPL2')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/szermatt/emacs-bash-completion/archive/v${pkgver}.tar.gz")
sha256sums=('584f3db6fe380c1ccc0106f51e80ed448db10327c022cbd48e46e5b1c76418fc')

build() {
  cd $pkgname-$pkgver
  emacs -Q -batch -L . -f batch-byte-compile bash-completion.el
}

package() {
  cd $pkgname-$pkgver
  install -d "${pkgdir}"/usr/share/emacs/site-lisp/bash-completion
  install -m644 bash-completion.el{c,} "${pkgdir}"/usr/share/emacs/site-lisp/bash-completion/
}
