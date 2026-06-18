# Maintainer: Nick Humrich <nick@humrich.us>
pkgname=bridge-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="Global, dependency-aware task list that persists across repos and AI sessions"
arch=('x86_64' 'aarch64')
url="https://github.com/nhumrich/bridge"
license=('MIT')
provides=('bridge')
conflicts=('bridge')
source_x86_64=("br-${pkgver}-linux-amd64::${url}/releases/download/v${pkgver}/br-linux-amd64")
source_aarch64=("br-${pkgver}-linux-arm64::${url}/releases/download/v${pkgver}/br-linux-arm64")
sha256sums_x86_64=('0578bbaffa4769d0aa328cb18d1dbef17390176497af0bf4f30031143319b8bc')
sha256sums_aarch64=('1b7c0cba05ceaa3c7620647e2f26bdff0f33cc8254b643a2ad930cf067078a55')

package() {
  install -Dm755 "${srcdir}/br-${pkgver}-linux-amd64" "${pkgdir}/usr/bin/br" 2>/dev/null \
    || install -Dm755 "${srcdir}/br-${pkgver}-linux-arm64" "${pkgdir}/usr/bin/br"
  install -Dm644 "${startdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
