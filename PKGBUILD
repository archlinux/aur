# Maintainer: Nikita Almakov <nikita.almakov@gmail.com>

pkgname=rate-mirrors-bin
pkgver=0.24.0
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
sha256sums_x86_64=('7d5cbd6a3cac411b1aca9a1f87a71439cd9a9fcbc35d17a3fd16166f08c78e22')
sha256sums_aarch64=('4cbb5d151b4548bc2cf2637947ae47dbe34cbd225673b817acd510fb4b4bc8e3')
