# Maintainer: Nikita Almakov <nikita.almakov@gmail.com>

pkgname=rate-mirrors-bin
pkgver=0.13.0
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
sha512sums_x86_64=('99e7ae6ed149c01272089d02a75092d0e977886ef1615731d2e04a87084e874a1b4675c1937e62cac4974955dfdcdc16c904ee02bd8aa7963280686f1138ad40')
sha512sums_aarch64=('00826506c3367ade4f36a55cf11908b55921f75ef80e8f00516a0bfbb36565b2eae1c0f079c962531b0dce1e76c8dc2a05b9f24c77ed59e39dee45493c4a1a58')

build() {
  tar xzf "${pkgname}-${pkgver}.tar.gz"
}

package() {
  cd "rate-mirrors-v${pkgver}-${CARCH}-unknown-linux-musl"

  install -Dm755 "rate_mirrors" "$pkgdir/usr/bin/rate-mirrors"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

#vim: syntax=sh
