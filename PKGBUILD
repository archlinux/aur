# Maintainer: hamki <hamki.do2000@gmail.com>

pkgname=emacs-annalist
pkgver=1.0.1
pkgrel=1
pkgdesc="annalist.el is a library that can be used to record information and later print that information using org-mode headings and tables."
url="https://github.com/noctuid/annalist.el"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=()
provides=()
conflicts=()
source=('https://github.com/noctuid/annalist.el/archive/refs/tags/1.0.1.tar.gz')
sha256sums=('cd6d8fffaa717c5384b8be68d78eda96cc31f94405a368c1ad68ac683107084f')

build() {
  cd "${srcdir}/annalist.el-$pkgver"
  emacs -Q -batch -L . -f batch-byte-compile *.el
 }

package() {
  cd "${srcdir}/annalist.el-$pkgver"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/$pkgname"
  install -m644 *.el* "${pkgdir}/usr/share/emacs/site-lisp/$pkgname/"
}
