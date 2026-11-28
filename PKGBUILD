# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=viceroy-bin
pkgver=0.22.0
pkgrel=1
pkgdesc="Local testing environment for Fastly Compute"
arch=('x86_64' 'aarch64')
url="https://github.com/fastly/Viceroy"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/fastly/Viceroy/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/viceroy_v${pkgver}_linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/viceroy_v${pkgver}_linux-arm64.tar.gz")
sha256sums=('268872b9816f90fd8e85db5a28d33f8150ebb8dd016653fb39ef1f94f2686bc5')
sha256sums_x86_64=('03f66f27275e8adc0c1857c4f571bd6f5ae997e38cc43760b19c6840a92b298d')
sha256sums_aarch64=('414c438938984572a5911c7491471a1a8bff6808c9e371c84704f6d0df43ded3')

package() {
  install -Dm755 "viceroy" "${pkgdir}/usr/bin/viceroy"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
