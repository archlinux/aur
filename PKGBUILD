# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=safebucket-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Self-hosted file sharing service"
arch=('x86_64' 'aarch64')
url="https://github.com/safebucket/safebucket"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/safebucket/safebucket/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/safebucket-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/safebucket-linux-arm64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('95a8c3f64e32104c58e5205880f1e2a59b2444b2217b6af19afca84432ac2609')
sha256sums_aarch64=('ac3ac172ca49798149cc04e1548c74fef84a2865e125d82802ece98ebec62f5f')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/safebucket"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
