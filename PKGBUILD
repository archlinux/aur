# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=faramesh-core-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Governance-as-code for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/faramesh/faramesh-core"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/faramesh/faramesh-core/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/faramesh-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/faramesh-linux-arm64")
sha256sums=('e45da05b6d8eb3cbde533048f793be752c9d2d596f9265cf43efb6d9ced342a8')
sha256sums_x86_64=('d95c739252957c1059e58a66d52b74262562ff7a8c43812e03e34755df650ed9')
sha256sums_aarch64=('316f92764546763c56840287cb1f94393637b93726e3b57cd552c6f009f57222')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/faramesh"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
