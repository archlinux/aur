# Maintainer: dafagareth <dafagareth@gmail.com>

# Prebuilt-binary package of svault. Installs the release binary directly without
# a Go toolchain. The sha256sums below MUST match the files in the release's
# checksums.txt; update them on every new version.

pkgname=svault-bin
pkgver=1.0.0
epoch=1
pkgrel=1
pkgdesc="Local encrypted secret vault for developers (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/dafagareth/svault"
license=('MIT')
provides=('svault')
conflicts=('svault')
source_x86_64=("svault-$pkgver-x86_64::https://github.com/dafagareth/svault/releases/download/v$pkgver/svault-linux-amd64")
source_aarch64=("svault-$pkgver-aarch64::https://github.com/dafagareth/svault/releases/download/v$pkgver/svault-linux-arm64")
# sha256 from the release checksums.txt (svault-linux-amd64 / svault-linux-arm64):
#   curl -fsSL https://github.com/dafagareth/svault/releases/download/v$pkgver/checksums.txt
sha256sums_x86_64=('f8ed8ecdaeba36ab0452dd949b526b08ba8b438c5c7aeb867c421c55be01bc33')
sha256sums_aarch64=('999154a6e6e34396ef5f6e248b67f7914a50bc0e84a42a1091ab222a1b0fd7a6')

package() {
  install -Dm755 "svault-$pkgver-$CARCH" "$pkgdir/usr/bin/svault"
}
