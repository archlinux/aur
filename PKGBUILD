# Maintainer: Noel Jacob
# Contributor: thdxr (original PKGBUILD)
# Contributor: 37h4n (aarch64 support added by Ethan Reece <aur at ethanreece dot com>)
pkgname=bunjs-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="All-in-one JavaScript runtime built for speed, with a native bundler, transpiler, test runner, and npm-compatible package manager baked-in."
arch=('x86_64' 'aarch64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
conflicts=("bun" "bun-bin")
source_x86_64=("bun-linux-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
source_aarch64=("bun-linux-aarch64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-aarch64.zip")
sha256sums_x86_64=('059d589aed967b10b801dddc4b4668f4ae96b582fcae5a88616a6b9353323ac8')
sha256sums_aarch64=('7dd9f7c846af2541307148b2afdbddff4c95ce4b892f04ef55e21a2dc6642a1b')

package() {
  if [ "${CARCH}" == "aarch64" ]; then
  	install -Dm755 "./bun-linux-aarch64/bun" "${pkgdir}/usr/bin/bun"
  else
  	install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
  fi
}

