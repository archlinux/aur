# Maintainer: Poscat <poscat@mail.poscat.moe>

pkgname=emacs-rich-minority
pkgver=1.0.3
pkgrel=1
pkgdesc="Emacs package for hiding and/or highlighting the list of minor-modes in the mode-line."
arch=(any)
url="https://github.com/Malabarba/rich-minority"
license=('GPL3')
depends=('emacs')
source=("https://github.com/Malabarba/rich-minority/archive/${pkgver}.tar.gz")
sha256sums=('0062979b9fff26886d5136a51c920af8327a3757c5073cf9789a67d5fed2e7fe')

build() {
  cd "${srcdir}/rich-minority-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/rich-minority-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/rich-minority/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/rich-minority/"
}
