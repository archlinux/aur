# Maintainer: MobiusHorizons <codemobius@gmail.com>
pkgname=libe
pkgver=0.11.0
pkgrel=1
pkgdesc="Library containing high-performance datastructures and utilities for C++ used by hyperdex"
url="https://github.com/rescrv/e"
arch=('x86_64' 'i686')
license=('BSD')
depends=()
makedepends=('wget' 'gcc')
conflicts=()
replaces=()
backup=()
source=("http://hyperdex.org/src/${pkgname}-${pkgver}.tar.gz")
md5sums=('8ddff754a8478fcd9f2face6c18c5ef6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
