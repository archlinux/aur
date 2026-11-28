# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=boring-registry-bin
pkgver=0.20.0
pkgrel=1
pkgdesc="Simple Terraform provider and module registry"
arch=('x86_64' 'aarch64')
url="https://github.com/boring-registry/boring-registry"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/boring-registry_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/boring-registry_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('c579e35a23786ee2e62c3d4d2ba5effa4427c2ddd11c50da145c3e8e67485fc7')
sha256sums_aarch64=('da7381f4b4bf948e733ff367b1778fa88b93627f7bdf3ed2220c20562de08c30')

package() {
  install -Dm755 "boring-registry" "${pkgdir}/usr/bin/boring-registry"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
