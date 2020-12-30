# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=gqrx-scanner
pkgver=1.0.2
pkgrel=1
pkgdesc='A frequency scanner for Gqrx Software Defined Radio receiver'
url='https://github.com/neural75/gqrx-scanner'
license=('MIT')
arch=('x86_64')
makedepends=('cmake')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d15739fb99292ec10ce707b7d802b2cbed1a856c8e8bffd6ce827c091886231b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake .
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d -m755 "$pkgdir"/usr/bin
  install -D -m755 bin/gqrx-scanner "$pkgdir"/usr/bin
}
