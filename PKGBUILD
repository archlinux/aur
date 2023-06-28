# Maintainer: Noel Jacob
# Contributor: thdxr (original PKGBUILD)
# Contributor: 37h4n (aarch64 support added by Ethan Reece <aur at ethanreece dot com>)
pkgname=bunjs-bin
pkgver=0.6.11
pkgrel=1
pkgdesc="All-in-one JavaScript runtime built for speed, with a native bundler, transpiler, test runner, and npm-compatible package manager baked-in."
arch=('x86_64' 'aarch64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
conflicts=("bun" "bun-bin")
source_x86_64=("bun-linux-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
source_aarch64=("bun-linux-aarch64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-aarch64.zip")
sha256sums_x86_64=('7cd19c4e0f268d10584d37a43d45e435891832b5fac5d5e8c44f321d40e7d21e')
sha256sums_aarch64=('3f07ca55c7b4354047b1ecdfa7ccc51157144b1a165b97d3f99f7160d2abfe85')

package() {
  if [ "${CARCH}" == "aarch64" ]; then
  	install -Dm755 "./bun-linux-aarch64/bun" "${pkgdir}/usr/bin/bun"
  else
  	install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
  fi
}

