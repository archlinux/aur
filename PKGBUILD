# Maintainer: Jon Eyolfson <jon@eyl.io>
# Contributor: Chirantan EKbote <chirantan.ekbote at gmail.com>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=emacs-helm
pkgver=2.9.4
pkgrel=1
pkgdesc="Incremental completion and selection narrowing framework for Emacs"
url="https://github.com/emacs-helm/helm"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-async')
makedepends=('git')
provides=('emacs-helm')
conflicts=('emacs-helm')
source=("https://github.com/emacs-helm/helm/archive/v${pkgver}.tar.gz")
sha256sums=('128cf2072a091be8f2b4925dac45b0e6dde5d3ad4486d4585af8702a0d89754e')

build() {
  cd "${srcdir}/helm-${pkgver}"
  make
}

package() {
  cd "${srcdir}/helm-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/helm"
  install -m644 helm* "${pkgdir}/usr/share/emacs/site-lisp/helm/"
}
