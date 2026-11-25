# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ontology-bin
pkgver=3.3.1
pkgrel=1
pkgdesc="Go implementation of the Ontology blockchain protocol"
arch=('x86_64')
url="https://github.com/ontio/ontology"
license=('LGPL-3.0-only')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ontio/ontology/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/ontology-linux-amd64")
sha256sums=('da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768')
sha256sums_x86_64=('a8491cbbe0efbe0f51e7982c58fa921ebfdc9cf1c81757b44c282c009a65ad03')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/ontology"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
