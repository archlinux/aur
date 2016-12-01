# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=egypt
pkgver=1.10
pkgrel=1
pkgdesc="A simple tool for creating call graphs of C programs"
arch=("any")
url="https://www.gson.org/egypt/"
# The author states: "This program is free software; you can redistribute
# it and/or modify it under the same terms as Perl itself."
license=('GPL' 'PerlArtistic')
depends=("perl" "gcc" "graphviz")
makedepends=("perl")
optdepends=("gcc: for generating an intermediate representation of C code (RTL files)"
            "graphviz: for visualising the resulting graph")
source=("https://www.gson.org/egypt/download/$pkgname-$pkgver.tar.gz")
md5sums=('591dce680bef60e73edccd0220957846')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  perl Makefile.PL
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
