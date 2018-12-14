# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-company-mode
pkgver=0.9.9
pkgrel=1
pkgdesc="Modular in-buffer completion framework for Emacs"
url="http://company-mode.github.io"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-company-mode')
source=("$pkgname-$pkgver.tar.gz::https://github.com/company-mode/company-mode/archive/${pkgver}.tar.gz")
sha256sums=('fc9a6fb2328ce5017386ff9888ee11ba6d1bcaadf6e13b07e47c355edb612d96')

build() {
  cd company-mode-${pkgver}
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd company-mode-${pkgver}
  install -d "${pkgdir}"/usr/share/emacs/site-lisp/company-mode
  install -m644 *.el{c,} "${pkgdir}"/usr/share/emacs/site-lisp/company-mode/
}
