# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-use-package
pkgver=2.3
pkgrel=1
pkgdesc="A use-package declaration for simplifying your .emacs"
url="https://github.com/jwiegley/use-package"
arch=('any')
license=('GPL2')
depends=('emacs')
makedepends=('git')
provides=('emacs-use-package')
source=("https://github.com/jwiegley/use-package/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/use-package-${pkgver}"
  emacs -Q -batch -L . -f batch-byte-compile {use-package,bind-key}*.el
}

package() {
  cd "${srcdir}/use-package-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/use-package"
  install -m644 {use-package,bind-key}.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/use-package/"
}
