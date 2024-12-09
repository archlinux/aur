# Maintainer: envolution
# Contributor: grimi
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=bencodetools
pkgver=1.0.1
pkgrel=1
pkgdesc="A collection of tools for manipulating bencoded data."
arch=("x86_64")
url="https://gitlab.com/heikkiorsila/bencodetools"
license=("custom")
makedepends=("git")
source=("git+https://gitlab.com/heikkiorsila/bencodetools.git#tag=v${pkgver}")
md5sums=('68125158237362f86ca56d2042046ff7')

build() {
  cd ${pkgname}
  ./configure --prefix=/usr --lib-path=/usr/lib --package-prefix="${pkgdir}" --without-python
  make
}

package() {
  cd ${pkgname}
  make install
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname%-git}/LICENSE
}
# vim:set ts=2 sw=2 et:
