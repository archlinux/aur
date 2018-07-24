# Maintainer: sballert <sballert@posteo.de>
# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-diminish
pkgver=0.45
pkgrel=1
pkgdesc="Diminished modes are minor modes with no modeline display"
url="https://github.com/emacsmirror/diminish"
arch=('any')
license=('GPL2')
depends=('emacs')
makedepends=('git')
provides=('emacs-diminish')
source=("$pkgname-$pkgver.tar.gz::https://github.com/emacsmirror/diminish/archive/v${pkgver}.tar.gz")
sha256sums=('aa66490c925040921eacc5122a4ce5b04c4460bfa1c39344212731ebbbb83151')

build() {
  cd "${srcdir}/diminish-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile diminish*.el
}

package() {
  cd "${srcdir}/diminish-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/diminish"
  install -m644 diminish*.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/diminish/"
}
