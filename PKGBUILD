# Maintainer:
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=emacs-pkgbuild-mode
pkgver=0.14
pkgrel=2
pkgdesc="A major mode for creating packages with emacs"
arch=('any')
url="https://github.com/juergenhoetzel/pkgbuild-mode"
license=('GPL')
depends=('emacs')
install=emacs-pkgbuild-mode.install
source=($pkgname-$pkgver.tar.gz::https://github.com/juergenhoetzel/pkgbuild-mode/tarball/${pkgver})
sha512sums=('1d6d4d2aa35b071944d3689eaa87be1c780f6e2785c5fc6ef8ef1e2ac66ff57fa519a2226e3d1438662182098ac486a0331b579c1895ac59f49cb33e498e10a9')

package() {
  cd juergenhoetzel-pkgbuild-mode-*
  emacs -batch -f batch-byte-compile pkgbuild-mode.el
  install -d "${pkgdir}/usr/share/emacs/site-lisp"
  install -D -m644 pkgbuild-mode.el pkgbuild-mode.elc "${pkgdir}/usr/share/emacs/site-lisp"
}
