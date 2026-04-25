# Maintainer: Nick Humrich <nick@humrich.us>
pkgname=bridge-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Global, dependency-aware task list that persists across repos and AI sessions"
arch=('x86_64' 'aarch64')
url="https://github.com/nhumrich/bridge"
license=('MIT')
provides=('bridge')
conflicts=('bridge')
source_x86_64=("br-${pkgver}-linux-amd64::${url}/releases/download/v${pkgver}/br-linux-amd64")
source_aarch64=("br-${pkgver}-linux-arm64::${url}/releases/download/v${pkgver}/br-linux-arm64")
sha256sums_x86_64=('21993647405bd0274117394a0355bc42d9a20b55ce3d6cd5cea7e142e88fc383')
sha256sums_aarch64=('23de0b6bc60517994aa92bfa2b0a88f8028a400c3e6a2bfbbe98e35bf6860907')

package() {
  install -Dm755 "${srcdir}/br-${pkgver}-linux-amd64" "${pkgdir}/usr/bin/br" 2>/dev/null \
    || install -Dm755 "${srcdir}/br-${pkgver}-linux-arm64" "${pkgdir}/usr/bin/br"
  install -Dm644 "${startdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
