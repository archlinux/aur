# Maintainer: Tomoaki Hashizaki <thashisaki@yahoo.com>

pkgname=cafeobj-sbcl
pkgver=1.5.4
pkgrel=1
pkgdesc="New generation algebraic specification and programming language (built by SBCL)"
arch=("i686" "x86_64")
url="https://cafeobj.org/"
license=('BSD')
source_i686=("https://cafeobj.org/files/1.5.4/cafeobj-1.5.4-sbcl-x32Linux.tar.gz")
source_x86_64=("https://cafeobj.org/files/1.5.4/cafeobj-1.5.4-sbcl-x64Linux.tar.gz")
sha256sums_i686=('0c82b7456398a8e6f9db543c539fecf61279bf6733a47f93f51f661629093289')
sha256sums_x86_64=('2322ad4f47f57eec7879093cd661a9545260ab4351a3b423813ce95a416926f6')
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
}