# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-company-mode
pkgver=0.9.8
pkgrel=1
pkgdesc="Modular in-buffer completion framework for Emacs"
url="http://company-mode.github.io"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-company-mode')
source=("$pkgname-$pkgver.tar.gz::https://github.com/company-mode/company-mode/archive/${pkgver}.tar.gz")
sha256sums=('89ade7ba4556921df00114ed30cfea34965b9a24aba29a8f17d0034d883c2282')

build() {
  cd company-mode-${pkgver}
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd company-mode-${pkgver}
  install -d "${pkgdir}"/usr/share/emacs/site-lisp/company-mode
  install -m644 *.el{c,} "${pkgdir}"/usr/share/emacs/site-lisp/company-mode/
}
