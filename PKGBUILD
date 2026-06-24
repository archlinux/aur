# Maintainer: hahwul <hahwul@gmail.com>
pkgname=cjules
pkgver=0.2.1
pkgrel=2
pkgdesc="Crystal CLI for the Jules API with multi-account support, bulk ops, watch mode, and gitPatch extraction."
arch=('x86_64' 'aarch64')
url="https://github.com/hahwul/cjules"
license=('MIT')
source=("LICENSE-cjules-${pkgver}::https://raw.githubusercontent.com/hahwul/cjules/refs/tags/v${pkgver}/LICENSE")
sha256sums=('SKIP')
source_x86_64=("cjules-${pkgver}-x86_64::https://github.com/hahwul/cjules/releases/download/v${pkgver}/cjules-v${pkgver}-linux-x86_64")
source_aarch64=("cjules-${pkgver}-aarch64::https://github.com/hahwul/cjules/releases/download/v${pkgver}/cjules-v${pkgver}-linux-arm64")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  if [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/cjules-${pkgver}-aarch64" "${pkgdir}/usr/bin/cjules"
  else
    install -Dm755 "${srcdir}/cjules-${pkgver}-x86_64" "${pkgdir}/usr/bin/cjules"
  fi
  install -Dm644 "${srcdir}/LICENSE-cjules-${pkgver}" "${pkgdir}/usr/share/licenses/cjules/LICENSE"
}
