# Maintainer: sballert <sballert@posteo.de>
# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-projectile
pkgver=1.0.0
pkgrel=1
pkgdesc="Project Interaction Library for Emacs"
arch=(any)
url="https://github.com/bbatsov/projectile"
license=('GPL3')
depends=('emacs' 'emacs-pkg-info')
source=("https://github.com/bbatsov/projectile/archive/v${pkgver}.tar.gz")
sha256sums=('7c6f327a1574db2f29a742f3141a9f28f5165c12c80c873c983769623bfe594a')

build() {
  cd "${srcdir}/projectile-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/projectile-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/projectile/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/projectile/"
}
