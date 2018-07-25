# Maintainer: sballert <sballert@posteo.de>
# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-counsel-projectile
pkgver=0.2.0
pkgrel=1
pkgdesc="Ivy UI for Projectile"
arch=(any)
url="https://github.com/ericdanan/counsel-projectile"
license=('GPL3')
depends=('emacs' 'emacs-swiper' 'emacs-projectile')
source=("https://github.com/ericdanan/counsel-projectile/archive/${pkgver}.zip")
sha256sums=('fd0059f7ca2340c228bb40551ef9a7eb1a394fe7906e991e32ab24f69b142778')

build() {
  cd "${srcdir}/counsel-projectile-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/counsel-projectile-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/counsel-projectile/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/counsel-projectile/"
}
