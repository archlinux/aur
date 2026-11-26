# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dependency-validator-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Check whether the versions of specified libraries are up to date"
arch=('x86_64' 'aarch64')
url="https://github.com/Cadeusept/dependency-validator"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dependency-validator-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/dependency-validator-linux-arm64.tar.gz")
sha256sums_x86_64=('1f9d09139c8ffd03351ca8bd666d7f92a08d300cad7fc3c7a397733e84b35095')
sha256sums_aarch64=('0ee9ebabfac96b1a2a12ee0a91c048a0f91f2ec022d110982c2b24839988c07f')

package() {
  install -Dm755 "dependency-validator" "${pkgdir}/usr/bin/dependency-validator"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
