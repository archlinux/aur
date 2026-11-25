# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=install-nothing-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Terminal app that pretends to install things but installs nothing"
arch=('x86_64' 'aarch64')
url="https://github.com/buyukakyuz/install-nothing"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/buyukakyuz/install-nothing/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/install-nothing-linux-x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/install-nothing-linux-aarch64")
sha256sums=('b0d67e90f1226bcf8de6f491acc31c6b8aca1555edfde60afb520ab824ff342e')
sha256sums_x86_64=('c1ced173780b69d41614871295131f726d9afcf4e60e58a113b730950010adfb')
sha256sums_aarch64=('1cadf27548da970957fe96ede3c711422df138b4dc12eb56435582ef5aac4826')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/install-nothing"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
