# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=tezos-bin
pkgver=9.2_1
pkgrel=1
pkgdesc='Tezos static binaries by Serokell'
arch=('x86_64')
url='https://github.com/serokell/tezos-packaging'
license=('MIT')
provides=('tezos')
conflicts=('tezos')
options=(!strip)
depends=()
source=("https://github.com/serokell/tezos-packaging/releases/download/v${pkgver//_/-}/binaries-${pkgver//_/-}.tar.gz"
        "https://github.com/serokell/tezos-packaging/releases/download/v${pkgver//_/-}/binaries-${pkgver//_/-}.tar.gz.asc")
md5sums=('5cad3c9a101f7553f338ebf66ac44b6c'
         'SKIP')

package() {
  cd ${srcdir}
  dst="${pkgdir}/usr/bin"
  mkdir -p ${dst}
  install tezos-* ${dst}
}
