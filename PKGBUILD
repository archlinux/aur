# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=fogg-bin
pkgver=0.92.56
pkgrel=1
pkgdesc="Manage infrastructure as code with less pain"
arch=('x86_64' 'aarch64')
url="https://github.com/chanzuckerberg/fogg"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/chanzuckerberg/fogg/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/fogg_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/fogg_${pkgver}_linux_arm64.tar.gz")
sha256sums=('ff51f32157d9a53b482bddb1552ea7bb7d8152a8e9e6e72d1a535b37e3276c09')
sha256sums_x86_64=('b97053c38ebbeffcb6567e88dc6ca17f67c3953cfe81f8a7825027332e0b4857')
sha256sums_aarch64=('7a351ee1dc27197f99e2125824c0e0393cf16eef7a449b94b88ae897a4444539')

package() {
  install -Dm755 "fogg" "${pkgdir}/usr/bin/fogg"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
