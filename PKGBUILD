# Maintainer: a2sc <a_dev at a2sc eu>
# Contributor: livekit project
#
# Arch Linux PKGBUILD for livekit
# https://github.com/livekit

pkgname=livekit-cli-bin
pkgver=2.16.3
pkgrel=1
pkgdesc='LiveKit CLI: command line utilities that interacts with LiveKit'
arch=(x86_64 aarch64 armv7h)
url='https://livekit.io/'
license=(Apache)
makedepends=(go)
options=(!debug)

source_x86_64=(
    "https://github.com/livekit/livekit-cli/releases/download/v${pkgver}/lk_${pkgver}_linux_amd64.tar.gz"
)

source_aarch64=(
    "https://github.com/livekit/livekit-cli/releases/download/v${pkgver}/lk_${pkgver}_linux_arm64.tar.gz"
)

source_armv7h=(
    "https://github.com/livekit/livekit-cli/releases/download/v${pkgver}/lk_${pkgver}_linux_arm.tar.gz"
)

sha256sums_x86_64=('57935ce348a634a1e12769b9eaf7e684cf46920ad65e4b6d88f87a9cd01de2d6')
sha256sums_aarch64=('31aa8d5d10455faf4d184674d639f9c03b0a7c64be1dacd32ecc48ec1c5b9df8')
sha256sums_armv7h=('f00fde381cf68820acfaaf7fa4fc599f6236e0e03a72ce27a6ffd1fa8b156288')

package() {
  install -vDm755 "${srcdir}/lk" -t "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin"
  ln -s lk "livekit-cli"
}
