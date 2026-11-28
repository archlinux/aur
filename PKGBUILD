# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=wayfinder-maps-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="Planetary visualization tool"
arch=('x86_64' 'aarch64')
url="https://github.com/rengwu/wayfinder-maps"
license=('MIT')
depends=('glib2' 'glibc' 'gtk3' 'webkit2gtk-4.1')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/rengwu/wayfinder-maps/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/wayfinder-maps_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/wayfinder-maps_${pkgver}_linux_arm64.tar.gz")
sha256sums=('76e0cfe61e6462ba36fdc9a03a0ceb55fbbcc5e4531b976d8ac33ca35b05f27c')
sha256sums_x86_64=('39c227796c46f01b02b5cbb9722096cf3db17c9fd4a182505aa433b9cd438ef3')
sha256sums_aarch64=('a8a4abd450c9b19a8a3966278814e72be7d7eb64609f13457c65c75f5b05ad3f')

package() {
  install -Dm755 "wayfinder-maps-webview" "${pkgdir}/usr/bin/wayfinder-maps-webview"
  install -Dm755 "wayfinder-maps" "${pkgdir}/usr/bin/wayfinder-maps"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
