# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=commitsar-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Check that commits follow the Conventional Commits standard"
arch=('x86_64' 'aarch64')
url="https://github.com/aevea/commitsar"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/commitsar_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/commitsar_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('975a2920e7eaf63db3d99c43a72cdf50a05760cc66d4f6a28d69289d4982f793')
sha256sums_aarch64=('2fafcf5f2309644f687de9bd7ab23a21bc2c471ae724f720bbc9fff1cab5cfaf')

package() {
  install -Dm755 "commitsar" "${pkgdir}/usr/bin/commitsar"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
