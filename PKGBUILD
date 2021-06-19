# Maintainer: hamki <hamki.do2000@gmail.com>

pkgname=emacs-helm-ag
pkgver=0.64
pkgrel=1
pkgdesc="helm-ag.el provides interfaces of The Silver Searcher with helm."
url="https://github.com/emacsorphanage/helm-ag"
arch=('any')
license=('GPL3')
depends=('emacs-helm' 'the_silver_searcher')
makedepends=()
provides=()
conflicts=()
source=("https://github.com/emacsorphanage/helm-ag/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('85ab7836049b58566824703eacde10d0cddbe0c71fac88977460da56ff7a1ee2')

build() {
  cd "${srcdir}/helm-ag-${pkgver}"
emacs -batch -L . -f batch-byte-compile *.el

}

package() {
  cd "${srcdir}/helm-ag-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/emacs-helm-ag"
  install -m644 helm* "${pkgdir}/usr/share/emacs/site-lisp/emacs-helm-ag/"
}
