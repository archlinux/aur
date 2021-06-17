# Maintainer: hamki <hamki.do2000@gmail.com>

pkgname=emacs-use-package
pkgver=2.4.1
pkgrel=1
pkgdesc="A use-package declaration for simplifying your .emacs"
url="https://github.com/jwiegley/use-package"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=()
provides=()
source=("https://github.com/jwiegley/use-package/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d4f702e79438ce2712b943b3c551d320171c1cf65325c184b2d456e99aaa0051')

build() {
  cd "${srcdir}/use-package-${pkgver}"
  emacs -Q -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/use-package-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/use-package"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/use-package/"
}
