# Maintainer: Noel Jacob
# Contributor: thdxr (original PKGBUILD)
# Contributor: 37h4n (aarch64 support added by Ethan Reece <aur at ethanreece dot com>)
pkgname=bunjs-bin
pkgver=0.6.13
pkgrel=1
pkgdesc="All-in-one JavaScript runtime built for speed, with a native bundler, transpiler, test runner, and npm-compatible package manager baked-in."
arch=('x86_64' 'aarch64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
conflicts=("bun" "bun-bin")
source_x86_64=("bun-linux-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
source_aarch64=("bun-linux-aarch64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-aarch64.zip")
sha256sums_x86_64=('7f7572b197537ece06e1ae3c01a85b68400256988a3c6ece7db0184c21878b59')
sha256sums_aarch64=('1ebddcd3ce347f3e3b8c33638a04eccfb1c45123fa6ed5d50c5514b43b5d3b92')

package() {
  if [ "${CARCH}" == "aarch64" ]; then
  	install -Dm755 "./bun-linux-aarch64/bun" "${pkgdir}/usr/bin/bun"
  else
  	install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
  fi
}

