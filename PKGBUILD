# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=tezos-bin
pkgver=9.5_1
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
sha512sums=('337e99aac4966df4a19f9b44746cf27b5adc7a844ccb46757778df2d724ff4d04a768030bb65f9a21c6983b81a2b8eef1b43ab27fa21133e6b14e3e19a9590f9'
            'SKIP')

package() {
  cd ${srcdir}
  dst="${pkgdir}/usr/bin"
  mkdir -p ${dst}
  install tezos-* ${dst}
}
