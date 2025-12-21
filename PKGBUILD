# Maintainer: snit <snit@cock.li>
# Contributor: tuxayo <victor@tuxayo.net>
# Contributor: netcrusher < tobias AT miglix DOT eu >
# Contributor: snit <snit@cock.li>

pkgname=makeheaders
pkgver=2.27
pkgrel=1
pkgdesc="simple utility that will automatically generate .h files from .{c,cpp} files"
arch=('i686' 'x86_64')
url="https://www.hwaci.com/sw/mkhdr/"
license=('BSD')

source=("https://fossil-scm.org/home/tarball/99675884a93c09125dbfbef0ca47959626c81545c132e247e67a08bd12ac7256/fossil-src-${pkgver}.tar.gz")

sha256sums=('eadee1f351ab396a985822e2ff6804987e699b7720d99d5754748a610c8a492c')

build() {
  cd "fossil-src-${pkgver}"
  ./configure
  make bld/makeheaders
}

package() {
  cd "fossil-src-${pkgver}"
  install -D -t "$pkgdir/usr/bin" "bld/makeheaders"
}
