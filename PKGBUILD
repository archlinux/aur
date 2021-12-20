# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

_pkg_name=emacs-hcl-mode
pkgname=emacs-hcl-mode-git
pkgver=0.03.3.gec27736
pkgrel=1
pkgdesc='Emacs major mode for HashiCorp HCL language'
arch=('any')
url='https://github.com/syohex/emacs-hcl-mode'
provides=('emacs-hcl-mode')
conflicts=('emacs-hcl-mode')
depends=('emacs')
license=('MIT')
source=('git+https://github.com/syohex/emacs-hcl-mode.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkg_name}"

  git describe --long --tags | sed 's/-/./g'
}

build() {
  cd "${srcdir}/${_pkg_name}"

  emacs -batch -f batch-byte-compile hcl-mode.el
}

package() {
  cd "${srcdir}/${_pkg_name}"

  install -Dm644 hcl-mode.el "${pkgdir}/usr/share/emacs/site-lisp/hcl-mode.el"
  install -Dm644 hcl-mode.elc "${pkgdir}/usr/share/emacs/site-lisp/hcl-mode.elc"
}
