# Maintainer: Jon Eyolfson <jon@eyl.io>

pkgname=emacs-async
pkgver=1.9.3
pkgrel=1
pkgdesc="A module for doing asynchronous processing in Emacs"
url="https://github.com/jwiegley/emacs-async"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-async')
conflicts=('emacs-async')
source=("https://github.com/jwiegley/emacs-async/archive/v${pkgver}.tar.gz")
sha256sums=('eadd291e75dd05aa1a0c7199ecc936b8c18b7981220612cb018f4c2ad0ba0c9d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/async"
  install -m644 async* "${pkgdir}/usr/share/emacs/site-lisp/async/"
}
