# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=deadcheck-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Dead man's switch that does not rely on your own infrastructure"
arch=('x86_64' 'aarch64')
url="https://github.com/adamdecaf/deadcheck"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/deadcheck_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/deadcheck_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('9178f548999ce5c033883531842a8dc7c11300b803a2fa4d7a533eac9090349f')
sha256sums_aarch64=('78c1363bc49d18dd75f96480d8c9df778ee50377587b5e6f7fc4005ff4c6443e')

package() {
  install -Dm755 "deadcheck" "${pkgdir}/usr/bin/deadcheck"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
