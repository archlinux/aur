# Maintainer: Jon Eyolfson <jon@eyl.io>
# Contributor: Chirantan EKbote <chirantan.ekbote at gmail.com>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=emacs-helm
pkgver=3.0
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
sha256sums=('3c32454ff09a5943cc36d941ca82fc58bce3b609aaabaffd960eab7b1903594c')

build() {
  cd "${srcdir}/helm-${pkgver}"
  make
}

package() {
  cd "${srcdir}/helm-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/helm"
  install -m644 helm* "${pkgdir}/usr/share/emacs/site-lisp/helm/"
}
