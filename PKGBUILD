# Maintainer: a2sc <a_dev at a2sc eu>
# Contributor: livekit project
#
# Arch Linux PKGBUILD for livekit-cli
# https://github.com/livekit/livekit-cli

pkgname=livekit-cli-bin
pkgver=2.19.4
pkgrel=1
pkgdesc='LiveKit CLI: command line utilities that interacts with LiveKit'
arch=(x86_64 aarch64)
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

sha256sums_x86_64=('cb0f769201faa13956a3999bee078ec63fd5f22b855a79c09d648283e50debae')
sha256sums_aarch64=('368b12e35fff71ff14867800f747da3714ec2a56b61b855d552c3d79ef4a9586')

package() {
  install -vDm755 "${srcdir}/lk" -t "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin"
  ln -s lk "livekit-cli"
}
