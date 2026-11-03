# Maintainer: Nick Humrich <nick@humrich.us>
pkgname=bridge-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="Global, dependency-aware task list that persists across repos and AI sessions"
arch=('x86_64' 'aarch64')
url="https://github.com/nhumrich/bridge"
license=('MIT')
provides=('bridge')
conflicts=('bridge')
source_x86_64=("br-${pkgver}-linux-amd64::${url}/releases/download/v${pkgver}/br-linux-amd64")
source_aarch64=("br-${pkgver}-linux-arm64::${url}/releases/download/v${pkgver}/br-linux-arm64")
sha256sums_x86_64=('47dc250e8cdd3a42f7ed449c7ff551d01828baac2c656e9c6d8e4e8045161d38')
sha256sums_aarch64=('221efdaea9b67bfd56d4d95e4089492266e1fb46cf12d3e2713c4f48b5adb9d0')

package() {
  install -Dm755 "${srcdir}/br-${pkgver}-linux-amd64" "${pkgdir}/usr/bin/br" 2>/dev/null \
    || install -Dm755 "${srcdir}/br-${pkgver}-linux-arm64" "${pkgdir}/usr/bin/br"
  install -Dm644 "${startdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
