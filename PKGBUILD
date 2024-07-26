# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=byedpi-bin
pkgver=0.11.2
pkgrel=3
pkgdesc="Bypass DPI"
arch=(aarch64 armv6h armv7h x86_64)
url="https://github.com/hufrea/${pkgname%-bin}"
license=(GPL-3.0-only)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
options=(!debug)
source=(
  ${pkgname%-bin}.service
)
source_aarch64=($url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-aarch64.tar.gz)
source_armv6h=( $url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-armv6.tar.gz)
source_armv7h=( $url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-armv7l.tar.gz)
source_x86_64=( $url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-x86_64.tar.gz)
b2sums=('676ed14a41fc3eca946aa731e75604c50e5459351d864da9192b332e3e34d3a4d9bb54d789a749b64de1fbd7532198ec9ffbdd627e092a68f4997d0006dbebce')
b2sums_aarch64=('e7d8f76386799bdcbac9d39ee5cc14269da90191c4888e4a90c681d5b9308303f539697ad59349f293226f0a5aee71e23519a1ce3cf984ab62c80eff2bb43468')
b2sums_armv6h=('2aaccf3b4f3ce4795a9af17c1506b248cf46963ab7321d9a32013e6ddef95d654706c985534ee76683642753c902f411c0af933763a6342324745840843a54b2')
b2sums_armv7h=('6d04e255a802525bd822540566141ef83d347f8b8c89d509ee21430409ecbee65b8fff54082be11c13da721f7bda76d08644c494267e46081d1676cd4c51f8b6')
b2sums_x86_64=('57e190c8dbc4c97f9c322100771b19946693758a8f9649ee25da3fa30787bd25e13acef8b8c8dd0f915c465b572049f44b7f6d65d1cd08889d5884a49e6c1031')

package() {
  install -vDm755 ciadpi-*                   "$pkgdir"/usr/bin/ciadpi
  install -vDm644 ${pkgname%-bin}.service -t "$pkgdir"/usr/lib/systemd/system/
}
