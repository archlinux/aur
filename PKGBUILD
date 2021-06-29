# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=tezos-bin
pkgver=9.3_1
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
sha512sums=('b48e7f5c0fe1ffd3db32d9674ef1faf59dea01402f6790b270ef58d6f89b95ee194dbfd4c519d4b054c44f8c91b00f0e389b55a1fb38df1d0886e93c1e7f4f6a'
            'SKIP')

package() {
  cd ${srcdir}
  dst="${pkgdir}/usr/bin"
  mkdir -p ${dst}
  install tezos-* ${dst}
}
