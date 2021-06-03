# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=tezos-bin
pkgver=9.1_1
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
md5sums=('851dc049b48e11eed06ae4b1b282e22b'
         'SKIP')

package() {
  cd ${srcdir}
  dst="${pkgdir}/usr/bin"
  mkdir -p ${dst}
  install tezos-* ${dst}
}
