# Maintainer: Nikita Almakov <nikita.almakov@gmail.com>

pkgname=rate-mirrors-bin
pkgver=0.15.1
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
sha512sums_x86_64=('d0f3c2586d8048ca83234f767505dd1c51f7c47ca53c98a4738fce887a5fe2b01886f9d129ae89a2ce879ea37a16c057a932472a4076ff477713f4202ebeb12c')
sha512sums_aarch64=('da98a6fff161080bc276c6bb63183abb047330ebb70c1456a03a8792c062d02760e7dc0d154ad67c603c453ddff020d03b84b7e9e2e315c1ab47a5290e517505')

build() {
  tar xzf "${pkgname}-${pkgver}.tar.gz"
}

package() {
  cd "rate-mirrors-v${pkgver}-${CARCH}-unknown-linux-musl"

  install -Dm755 "rate_mirrors" "$pkgdir/usr/bin/rate-mirrors"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

#vim: syntax=sh
