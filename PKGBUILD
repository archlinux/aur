# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=s3-proxy-bin
pkgver=5.3.0
pkgrel=1
pkgdesc="S3 reverse proxy with GET, PUT and DELETE and OpenID Connect or Basic authentication"
arch=('x86_64' 'aarch64')
url="https://github.com/oxyno-zeta/s3-proxy"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/s3-proxy_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/s3-proxy_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('52bc834e6ad7c15c7101f11a0660b2f152e67971cec8a019d9d2c30cb976e67a')
sha256sums_aarch64=('d966086cf59cd5cf60e725faf3df4772ef7d31d01e6870a95ba88911e3957690')

package() {
  install -Dm755 "s3-proxy" "${pkgdir}/usr/bin/s3-proxy"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
