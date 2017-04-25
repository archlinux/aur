# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-projectile
pkgver=0.14.0
pkgrel=1
pkgdesc="Project Interaction Library for Emacs"
arch=(any)
url="https://github.com/bbatsov/projectile"
license=('GPL3')
depends=('emacs' 'emacs-ag' 'emacs-helm')
source=("https://github.com/bbatsov/projectile/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/projectile-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/projectile-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/projectile/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/projectile/"
}
