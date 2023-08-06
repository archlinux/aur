# Maintainer: Noel Jacob
# Contributor: thdxr (original PKGBUILD)
# Contributor: 37h4n (aarch64 support added by Ethan Reece <aur at ethanreece dot com>)
pkgname=bunjs-bin
pkgver=0.7.3
pkgrel=1
pkgdesc="All-in-one JavaScript runtime built for speed, with a native bundler, transpiler, test runner, and npm-compatible package manager baked-in."
arch=('x86_64' 'aarch64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
conflicts=("bun" "bun-bin")
source_x86_64=("bun-linux-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
source_aarch64=("bun-linux-aarch64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-aarch64.zip")
sha256sums_x86_64=('d390ee86fd96ad85d64ba98a237cc1e50888962b6ccac5f09aecbef571c107d3')
sha256sums_aarch64=('0858a8d5b82c80d0f9e01ae49640958df0ef303171a587b587bee718c38976c7')

package() {
  if [ "${CARCH}" == "aarch64" ]; then
  	install -Dm755 "./bun-linux-aarch64/bun" "${pkgdir}/usr/bin/bun"
  else
  	install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
  fi
}

