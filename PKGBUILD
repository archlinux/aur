# Maintainer: Nick Humrich <nick@humrich.us>
pkgname=bridge-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="Global, dependency-aware task list that persists across repos and AI sessions"
arch=('x86_64' 'aarch64')
url="https://github.com/nhumrich/bridge"
license=('MIT')
provides=('bridge')
conflicts=('bridge')
source_x86_64=("br-${pkgver}-linux-amd64::${url}/releases/download/v${pkgver}/br-linux-amd64")
source_aarch64=("br-${pkgver}-linux-arm64::${url}/releases/download/v${pkgver}/br-linux-arm64")
sha256sums_x86_64=('847b68e5dc741d23178531f166a97a8b2c873076af3c63ef4efb4e76ae46f8ed')
sha256sums_aarch64=('266fbcd326147310bf75db50408d14d3bb8ac75d57e72bd65ae1036b42ae88b7')

package() {
  install -Dm755 "${srcdir}/br-${pkgver}-linux-amd64" "${pkgdir}/usr/bin/br" 2>/dev/null \
    || install -Dm755 "${srcdir}/br-${pkgver}-linux-arm64" "${pkgdir}/usr/bin/br"
  install -Dm644 "${startdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
