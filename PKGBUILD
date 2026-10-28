# Maintainer: a2sc <a_dev at a2sc eu>
# Contributor: livekit project
#
# Arch Linux PKGBUILD for livekit-cli
# https://github.com/livekit/livekit-cli

pkgname=livekit-cli-bin
pkgver=2.19.2
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

sha256sums_x86_64=('a234a95b9cd54303330e59eaf32da953cbfd2b74dbdabd69acae7aa5ff377c8e')
sha256sums_aarch64=('edcbd3ce453b420a9b59b0207869e6b1321026f4a24beb7013fef7cd9287cd9b')

package() {
  install -vDm755 "${srcdir}/lk" -t "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin"
  ln -s lk "livekit-cli"
}
