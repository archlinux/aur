# Maintainer: Jon Eyolfson <jon@eyl.io>

pkgname=emacs-async
pkgver=1.9.2
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
sha256sums=('fb1e87fe5a53fb4d92069d031ca17ba2122240e63b6c351ec6b488b421d1382b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/async"
  install -m644 async* "${pkgdir}/usr/share/emacs/site-lisp/async/"
}
