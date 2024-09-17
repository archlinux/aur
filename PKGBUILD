# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=byedpi-bin
pkgver=0.14
pkgrel=2
pkgdesc="A simple and fast software designed to bypass Deep Packet Inspection"
arch=(aarch64 armv6h armv7h x86_64)
url="https://github.com/hufrea/${pkgname%-bin}"
license=(MIT)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
options=(!debug)
backup=(etc/${pkgname%-bin}.conf)
source=(
  ${pkgname%-bin}.{conf,service}
  $url/raw/main/LICENSE
)
source_aarch64=($url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-aarch64.tar.gz)
source_armv6h=( $url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-armv6.tar.gz)
source_armv7h=( $url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-armv7l.tar.gz)
source_x86_64=( $url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-x86_64.tar.gz)
b2sums=('26d0b11e667d804c6795d2aaf1af8977ff198082cde53cd60a19fe80b38925cc3999287760ce2e676f0ad2ac67516f4b10457e9f88a6d9898113cdb720ee5339'
        '4edf7a873d9abfc0aedfc4219f2911280a4abb6e595336ef8fb33dd9cce37c07409f67c7e9cb25e6ae9be273a8815cb5baf651becd2eca7302f527c8034d3432'
        'dd51700e972d759a2297bddc15455477a9574b98174e48c6c89236999fb028c09b8eff8a67067bc49e1a8830e43c7a6d76c4c5c644716562818b02320463e1aa')
b2sums_aarch64=('778e842757ae085e80f632a4c9c5158bbceb59bcf844ea02a601ddc5c86902c0ed04afd8187a51d98cd588459caa89361b7697365eb32023c9919fc05650cc74')
b2sums_armv6h=('c1aa781e09845a43f3ecfae11000637eb62c1b6d5f6d692f0560693d7ff0051a62680b637f006d4c15a91bd60cfe04e8b3f6f48c95add9c78868a059b064d725')
b2sums_armv7h=('93345571c9d1002cfa2dd5227e2e8df980fe069c0b44aecba7731c48e9860b98b663ddc6050565b6ffe9ba9b9dbb97ed6b97e85956c6702fdad92de86634b30d')
b2sums_x86_64=('fe8b3140fd016c333057915772bbf1f10faba07cc0cd4df08c4fbbdb119ae2f5024c4080b6a67790f5d67b1e35d7aa824c103d91f104fc6efc5b616e461aff5b')

package() {
  install -vDm644 ${pkgname%-bin}.conf    -t "$pkgdir"/etc/
  install -vDm755 ciadpi-*                   "$pkgdir"/usr/bin/ciadpi
  install -vDm644 ${pkgname%-bin}.service -t "$pkgdir"/usr/lib/systemd/system/
  install -vDm644 LICENSE                 -t "$pkgdir"/usr/share/licenses/$pkgname/
}
