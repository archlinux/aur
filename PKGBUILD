# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=air-bin
pkgver=1.29.0
pkgrel=1
pkgdesc="Live reload for Go apps"
url="https://github.com/cosmtrek/${pkgname%-bin}"
arch=('x86_64' 'i686' 'aarch64')
license=(GPL3)
depends=(go)
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("${pkgname/-bin/}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${pkgname/-bin/}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${pkgname/-bin/}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('2aa2b1c266196a68f2ccb9d6c67039c062bd0641a85c8e4ec5513e427d69354c')
sha256sums_i686=('97e025ae7a57713399b759ac9f471425f0553ac4b22c44a9bf2c2356940dbe61')
sha256sums_aarch64=('0e2f6b370cf5293bdfdeebef787a85bc30d5c1c2219395daad01595a65619d91')

package() {
  install -Dvm755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
  install -Dvm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}
