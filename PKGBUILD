# Maintainer: Nikita Almakov <nikita.almakov@gmail.com>

pkgname=rate-mirrors-bin
pkgver=0.11.1
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
sha512sums_x86_64=('31411fdae2b0e29f59f43c8d9a9077081cbd83b9a79263369b6a6f4bf12dffb2042724a3d38e5f2de3a77f599f1d9069bbc5f38866357115c3e79052431fdfca')
sha512sums_aarch64=('99f8bd0a86e764370b81896854909eeb9d46f5853da50b728ccb7cf0027dbe4276b8dca4092b30eb47f9612fddb8772bc5cfa8bf9c92e5916e8d30cda4034fc7')

build() {
  tar xzf "${pkgname}-${pkgver}.tar.gz"
}

package() {
  cd "rate-mirrors-v${pkgver}-${CARCH}-unknown-linux-musl"

  install -Dm755 "rate_mirrors" "$pkgdir/usr/bin/rate-mirrors"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

#vim: syntax=sh
