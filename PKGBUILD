# Maintainer: Tomoaki Hashizaki <thashisaki@yahoo.com>

pkgname=cafeobj-sbcl
pkgver=1.5.5
pkgrel=1
pkgdesc="New generation algebraic specification and programming language (built by SBCL)"
arch=("i686" "x86_64")
url="https://cafeobj.org/"
license=('BSD')
source_i686=("https://cafeobj.org/files/1.5.5/cafeobj-1.5.5-sbcl-x32Linux.tar.gz")
source_x86_64=("https://cafeobj.org/files/1.5.5/cafeobj-1.5.5-sbcl-x64Linux.tar.gz")
sha256sums_i686=('93d8d558eeddf258f8f4361c8f6c78f067f6543544ce6c07d4e0358bd8845ee9')
sha256sums_x86_64=('8b4f6e873b17d7cbb1ee1929b0829492e4fbe4ca17eb23d1f96f51962bf44e17')
options=(!strip)

package() {
  cd "${srcdir}/"

  #bin
  install -Dm755 {${srcdir},${pkgdir}/usr/local}/bin/cafeobj

  #lib
  install -Dm755 {${srcdir},${pkgdir}/usr/local}/lib/cafeobj-1.5/sbcl/cafeobj.sbcl

  #share cafeobj-1.5
  install -d ${pkgdir}/usr/local/share/cafeobj-1.5/lib
  install -d ${pkgdir}/usr/local/share/cafeobj-1.5/prelude
  cp -r ${srcdir}/share/cafeobj-1.5/ ${pkgdir}/usr/local/share/

  #share doc
  install -d ${pkgdir}/usr/local/share/doc/cafeobj/examples
  cp -r ${srcdir}/share/doc/ ${pkgdir}/usr/local/share/

  #share man
  install -Dm755 {${srcdir}/share/,${pkgdir}/usr/local}/man/man1/cafeobj.1

  #share emacs
  install -Dm755 {${srcdir},${pkgdir}/usr}/share/emacs/site-lisp/cafeobj-mode.el
}