# Maintainer: Nikita Almakov <nikita.almakov@gmail.com>

pkgname=rate-mirrors-bin
pkgver=0.29.0
pkgrel=1
pkgdesc="Everyday-use client-side map-aware mirror ranking tool - pre-built with musl"
url="https://github.com/westandskif/rate-mirrors"
license=('CC-BY-NC-SA-3.0')
options=(!lto)
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/westandskif/rate-mirrors/releases/download/v${pkgver}/rate-mirrors-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/westandskif/rate-mirrors/releases/download/v${pkgver}/rate-mirrors-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
arch=('x86_64' 'aarch64')
depends=()
makedepends=()
conflicts=("rate-mirrors")
provides=("rate-mirrors")

build() {
  tar xzf "${pkgname}-${pkgver}-${CARCH}.tar.gz"
}

package() {
  cd "rate-mirrors-v${pkgver}-${CARCH}-unknown-linux-musl"

  install -Dm755 "rate_mirrors" "$pkgdir/usr/bin/rate-mirrors"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

#vim: syntax=sh
sha256sums_x86_64=('4b8d9e1b26c13e3ba6abbd942bcac37841393345d44c0cdd18924f9338c433c8')
sha256sums_aarch64=('cd5c2642942e83dda24ece54bd94a241c786460a3842f607349a69020dfd3e41')
