# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tellstone-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="In-memory Redis-compatible database"
arch=('x86_64' 'aarch64')
url="https://github.com/Saxy/Tellstone"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tellstone_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tellstone_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('7426b6cb3d9ff84af5b3999e6e31915474e159c676fd8bc5ebee1f34e3def550')
sha256sums_aarch64=('06f83d498fc9f5b605ec1b7e59d918a2b74f1978ba31c9955a0f4f4faff1752f')

package() {
  install -Dm755 "tellstone" "${pkgdir}/usr/bin/tellstone"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
