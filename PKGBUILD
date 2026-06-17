# Maintainer: Ednition <noreply@ednition.com>

pkgname=ednition-catapult
pkgver=0.9.0
pkgrel=1
pkgdesc="Catapult CLI — deploy and manage containerized apps on AWS (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://ednition.com"
license=('custom')
provides=('catapult')
conflicts=('catapult')
source_x86_64=("https://dl.catapult.ednition.com/cli/v${pkgver}/catapult_${pkgver}_linux_x86_64.tar.gz")
sha256sums_x86_64=('24974204b27a02b06f9c9ae37b2b629760de73e44e84b4550ee6c465cfb91ae3')
source_aarch64=("https://dl.catapult.ednition.com/cli/v${pkgver}/catapult_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('31eb8d67bbe7ef1e18b85b49aa9a6b70f9e4f61c9d5859ee22b63a71e331ffde')

package() {
  install -Dm755 "./catapult" "${pkgdir}/usr/bin/catapult"
  install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  if [ -f "./LICENSE" ]; then
    install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
