# Maintainer: Poscat <poscat@mail.poscat.moe>

pkgname=emacs-smart-mode-line
pkgver=2.13
pkgrel=1
pkgdesc="A powerful and beautiful mode-line for Emacs."
arch=(any)
url="https://github.com/Malabarba/smart-mode-line"
license=('GPL3')
depends=('emacs' 'emacs-rich-minority')
source=("https://github.com/Malabarba/smart-mode-line/archive/${pkgver}.tar.gz")
sha256sums=('4b7dbebf0a6a501208bcf82950b7c08aac86ae69419d1fc1d55e77c85cafdc69')

build() {
  cd "${srcdir}/smart-mode-line-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/smart-mode-line-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/smart-mode-line/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/smart-mode-line/"
}
