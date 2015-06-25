# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=coq-doc
pkgver=8.4pl6
pkgrel=2
pkgdesc='HTML documentation for coq, a formal proof management system.'
arch=('any')
url='http://coq.inria.fr/'
license=('GPL')
options=('!emptydirs')
source=("http://coq.inria.fr/distrib/V$pkgver/files/refman.tar.gz"
  "http://coq.inria.fr/distrib/V$pkgver/files/stdlib.tar.gz")
md5sums=('f926cf1938b1ab5eabba7a9640d08258'
         'e9d908bd87c1a5c3bb8a8ae863fc94fe')

package() {
  cd "$srcdir"
  prefix="${pkgdir}/usr/share/doc/coq"

  install -d -m 755 "$prefix/refman"
  install -m 644 refman/html/* "$prefix/refman/"
  install -d -m 755 "$prefix/stdlib"
  install -m 644 stdlib/html/* "$prefix/stdlib/"
  # Fix missing CSS
  ln -s ../stdlib/coqdoc.css "$prefix/refman/coqdoc.css"
}
