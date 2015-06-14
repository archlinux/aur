# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>

pkgname=auto-complete-clang-async
pkgver=0.5
pkgrel=1
pkgdesc="An emacs plugin to complete C and C++ code using libclang"
arch=('i686' 'x86_64')
url="https://github.com/Golevka/emacs-clang-complete-async"
license=('GPL')
install=$pkgname.install
depends=('emacs' 'auto-complete' 'clang')
makedepends=('git')
source=("git+https://github.com/Golevka/emacs-clang-complete-async.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cd "${srcdir}/emacs-clang-complete-async"
  make
}

package() {
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/"
  mkdir -p "${pkgdir}/usr/bin"

  cp "${srcdir}/emacs-clang-complete-async/clang-complete" "${pkgdir}/usr/bin"
  cp -rp "${srcdir}/emacs-clang-complete-async/auto-complete-clang-async.el" \
    "${pkgdir}/usr/share/emacs/site-lisp"
}

# vim:set ts=2 sw=2 et:
