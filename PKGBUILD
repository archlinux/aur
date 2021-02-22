# Maintainer: Nikita Almakov <nikita.almakov@gmail.com>

pkgname=rate-arch-mirrors-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Everyday-use client-side map-aware arch mirror ranking tool"
url="https://github.com/westandskif/rate-arch-mirrors"
license=('custom')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/westandskif/rate-arch-mirrors/releases/download/v${pkgver}/rate-arch-mirrors-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
arch=('x86_64')
depends=()
makedepends=()
conflicts=('rate-arch-mirrors')
sha512sums=('1d3f36ba8fadb6b8699a1d21bcb2bfdda1172b21eb163d2346ae9cefcb15624ab4fe39a087b70a8ba8b9a82c73628e52bfcbf85e6cc9864e13c36d409d13ec1f')

build() {
  tar xzf "${pkgname}-${pkgver}.tar.gz"
}

package() {
  cd "rate-arch-mirrors-v${pkgver}-x86_64-unknown-linux-musl"

  install -Dm755 "rate_arch_mirrors" "$pkgdir/usr/bin/rate-arch-mirrors"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

#vim: syntax=sh
