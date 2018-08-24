# Maintainer: Jon Eyolfson <jon@eyl.io>
# Contributor: Chirantan EKbote <chirantan.ekbote at gmail.com>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=emacs-helm
pkgver=2.9.8
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
sha256sums=('6a88da31eaa18e11ffcb0f120baf3db885a64a4e03a281705a33631a90ea2a29')

build() {
  cd "${srcdir}/helm-${pkgver}"
  make
}

package() {
  cd "${srcdir}/helm-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/helm"
  install -m644 helm* "${pkgdir}/usr/share/emacs/site-lisp/helm/"
}
