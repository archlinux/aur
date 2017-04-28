# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-eyebrowse
pkgver=0.7.5
pkgrel=1
pkgdesc="A simple-minded way of managing window configs in emacs"
arch=(any)
url="https://github.com/wasamasa/eyebrowse"
license=('GPL3')
depends=('emacs' 'emacs-dash')
source=("https://github.com/wasamasa/eyebrowse/archive/${pkgver}.tar.gz")                                                              
sha256sums=('SKIP')

build() {
  cd "${srcdir}/eyebrowse-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/eyebrowse-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/eyebrowse/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/eyebrowse/"
}
