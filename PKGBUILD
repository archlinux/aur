# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

_pkg_name=terraform-mode
pkgname=emacs-terraform-mode-git
pkgver=0.06.38.ge560caa
pkgrel=1
pkgdesc='Emacs major mode for HashiCorp terraform'
arch=('any')
url='https://github.com/emacsorphanage/terraform-mode'
provides=('emacs-terraform-mode')
conflicts=('emacs-terraform-mode')
depends=('emacs')
license=('MIT')
source=('git+https://github.com/emacsorphanage/terraform-mode')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkg_name}"

  git describe --long --tags | sed 's/-/./g'
}

build() {
  cd "${srcdir}/${_pkg_name}"

  emacs -batch -f batch-byte-compile terraform-mode.el
}

package() {
  cd "${srcdir}/${_pkg_name}"

  install -Dm644 terraform-mode.el "${pkgdir}/usr/share/emacs/site-lisp/terraform-mode.el"
  install -Dm644 terraform-mode.elc "${pkgdir}/usr/share/emacs/site-lisp/terraform-mode.elc"
}
