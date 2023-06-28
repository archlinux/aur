# Maintainer: Nikita Almakov <nikita.almakov@gmail.com>

pkgname=rate-mirrors-bin
pkgver=0.15.2
pkgrel=1
pkgdesc="Everyday-use client-side map-aware mirror ranking tool - pre-built with musl"
url="https://github.com/westandskif/rate-mirrors"
license=('custom')
options=(!lto)
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/westandskif/rate-mirrors/releases/download/v${pkgver}/rate-mirrors-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}.tar.gz::https://github.com/westandskif/rate-mirrors/releases/download/v${pkgver}/rate-mirrors-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
arch=('x86_64' 'aarch64')
depends=()
makedepends=()
conflicts=('rate-mirrors')
sha512sums_x86_64=('0d85d7e0241c1a6064b65500f1705294c82bcc2571f1fc744fc0023c08ed6b12065c1636a405c6aa1d867c61da2ab93059d4a9719e11b53c502f7c6b80763384')
sha512sums_aarch64=('c77c02b0047b7a0ea602188cdcb6d67536bffd251caca084272e2bb53ef098d02c0b411077c2d25d2261d2a3688a85c7de3868b744d9d46441f741004cea2ff1')

build() {
  tar xzf "${pkgname}-${pkgver}.tar.gz"
}

package() {
  cd "rate-mirrors-v${pkgver}-${CARCH}-unknown-linux-musl"

  install -Dm755 "rate_mirrors" "$pkgdir/usr/bin/rate-mirrors"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

#vim: syntax=sh
