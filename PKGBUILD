# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-counsel-projectile
pkgver=0.1
pkgrel=1
pkgdesc="Ivy UI for Projectile"
arch=(any)
url="https://github.com/ericdanan/counsel-projectile"
license=('GPL3')
depends=('emacs' 'emacs-swiper' 'emacs-projectile')
source=("https://github.com/ericdanan/counsel-projectile/archive/master.zip")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/counsel-projectile-master"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/counsel-projectile-master"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/counsel-projectile/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/counsel-projectile/"
}
