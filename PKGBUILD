# Maintainer: hamki <hamki.do2000@gmail.com>
# Contributor: Jon Eyolfson <jon@eyl.io>
# Contributor: Chirantan EKbote <chirantan.ekbote at gmail.com>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=emacs-helm
pkgver=3.7.1
pkgrel=1
pkgdesc="Incremental completion and selection narrowing framework for Emacs"
url="https://github.com/emacs-helm/helm"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-async')
makedepends=()
provides=()
conflicts=()
source=("https://github.com/emacs-helm/helm/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bb2b442f6b8c6d6b213c27316149a0a6d61cef62e91afa46fbc467fa8956d016')

build() {
  cd "${srcdir}/helm-${pkgver}"
  make
}

package() {
  cd "${srcdir}/helm-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/helm"
  install -m644 helm* "${pkgdir}/usr/share/emacs/site-lisp/helm/"
}
