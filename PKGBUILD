# Maintainer: Noel Jacob
# Contributor: thdxr (original PKGBUILD)
# Contributor: 37h4n (aarch64 support added by Ethan Reece <aur at ethanreece dot com>)
pkgname=bunjs-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="All-in-one JavaScript runtime built for speed, with a native bundler, transpiler, test runner, and npm-compatible package manager baked-in."
arch=('x86_64' 'aarch64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
conflicts=("bun" "bun-bin")
source_x86_64=("bun-linux-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
source_aarch64=("bun-linux-aarch64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-aarch64.zip")
sha256sums_x86_64=('71ccee42813a2d5f4d3da1f1d7867abdae10b176f771460befdf521b32932180')
sha256sums_aarch64=('f4ac2a6b757f2cc8ee6524b4d2e3cd9070275af068ff7de48339b06bdd374fcd')

package() {
  if [ "${CARCH}" == "aarch64" ]; then
  	install -Dm755 "./bun-linux-aarch64/bun" "${pkgdir}/usr/bin/bun"
  else
  	install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
  fi
}

