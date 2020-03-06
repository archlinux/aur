# Maintainer: Eugenio M. Vigo <emvigo@gmail.com> 

pkgname=emacs-nasm-mode
pkgver=1.1.1
pkgrel=2
pkgdesc='Emacs NASM mode'
arch=('any')
url='https://github.com/skeeto/nasm-mode'
license=('Unlicense')
depends=('emacs')
install="${pkgname}.install"
source=("https://github.com/skeeto/nasm-mode/archive/${pkgver}.tar.gz")
sha256sums=('f2d11652a671268256564b00eb7f198e0a2f8d3ac5bfbeb3ab1422185a9abd72')

build() {
  cd "${pkgname#emacs-}-${pkgver}"
  emacs -batch -q -f batch-byte-compile ${pkgname#emacs-}.el
}

package() {
  cd "${pkgname#emacs-}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp"
  install -Dm644 "${pkgname#emacs-}.el" "${pkgdir}/usr/share/emacs/site-lisp/"
  install -Dm644 "${pkgname#emacs-}.elc" "${pkgdir}/usr/share/emacs/site-lisp/"
}
