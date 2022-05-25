# Maintainer: Nikita Almakov <nikita.almakov@gmail.com>

pkgname=rate-mirrors-bin
pkgver=0.10.0
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
sha512sums_x86_64=('5999cb35660f7e6406e6fdf649bfd8ff600fac5e2c9fbea34a1d4cc4b2438aae51272a158d960e7f857f1aeac5a771d8839c28b311391ea896e1880550a3d2e0')
sha512sums_aarch64=('e6513ed899319c2d557ad176077a814bd102800bc592fc5cc47a7b8100b4f654d9db2c5637e46174a56596d04a4cc54c8ca17bb99dbef21b385f17c437661c1f')

build() {
  tar xzf "${pkgname}-${pkgver}.tar.gz"
}

package() {
  cd "rate-mirrors-v${pkgver}-${CARCH}-unknown-linux-musl"

  install -Dm755 "rate_mirrors" "$pkgdir/usr/bin/rate-mirrors"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

#vim: syntax=sh
