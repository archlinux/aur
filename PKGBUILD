# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-helm-projectile
pkgver=0.14.0
pkgrel=1
pkgdesc="Helm UI for Projectile"
arch=(any)
url="https://github.com/bbatsov/helm-projectile"
license=('GPL3')
depends=('emacs' 'emacs-helm' 'emacs-projectile')
source=("https://github.com/bbatsov/helm-projectile/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/helm-projectile-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/helm-projectile-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/helm-projectile/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/helm-projectile/"
}