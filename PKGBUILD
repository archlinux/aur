# Maintainer: Nick Humrich <nick@humrich.us>
pkgname=bridge-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Global, dependency-aware task list that persists across repos and AI sessions"
arch=('x86_64' 'aarch64')
url="https://github.com/nhumrich/bridge"
license=('MIT')
provides=('bridge')
conflicts=('bridge')
source_x86_64=("br-${pkgver}-linux-amd64::${url}/releases/download/v${pkgver}/br-linux-amd64")
source_aarch64=("br-${pkgver}-linux-arm64::${url}/releases/download/v${pkgver}/br-linux-arm64")
sha256sums_x86_64=('f6430147a02ad25eecc15ead7b5bc8c998736e263c73b22be41f27d48faa0750')
sha256sums_aarch64=('44b5daafa8d2bc9ce7d606cef63dceaceb65926ba82be5fa9af451342468aa7d')

package() {
  install -Dm755 "${srcdir}/br-${pkgver}-linux-amd64" "${pkgdir}/usr/bin/br" 2>/dev/null \
    || install -Dm755 "${srcdir}/br-${pkgver}-linux-arm64" "${pkgdir}/usr/bin/br"
  install -Dm644 "${startdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
