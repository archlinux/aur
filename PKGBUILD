# Maintainer: Nikita Almakov <nikita.almakov@gmail.com>

pkgname=rate-arch-mirrors-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Everyday-use client-side map-aware arch mirror ranking tool"
url="https://github.com/westandskif/rate-arch-mirrors"
license=('custom')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/westandskif/rate-arch-mirrors/releases/download/v${pkgver}/rate-arch-mirrors-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
arch=('x86_64')
depends=()
makedepends=()
conflicts=('rate-arch-mirrors')
sha512sums=('06150c7d4591045aff5db17dc8fe95f8bb24342dac7ad2c5b4b886c6513806594530a231a3239e9455e62a1e711951b4aeebf27138c8331088c1aaef8fc796ca')

build() {
  tar xzf "${pkgname}-${pkgver}.tar.gz"
}

package() {
  cd "rate-arch-mirrors-v${pkgver}-x86_64-unknown-linux-musl"

  install -Dm755 "rate_arch_mirrors" "$pkgdir/usr/bin/rate-arch-mirrors"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

#vim: syntax=sh
