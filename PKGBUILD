# Maintainer: a2sc <a_dev at a2sc eu>
# Contributor: livekit project
#
# Arch Linux PKGBUILD for livekit-cli
# https://github.com/livekit/livekit-cli

pkgname=livekit-cli-bin
pkgver=2.19.0
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

sha256sums_x86_64=('601ce74299db7e538014426644ab23b2a1ba171c506967197a259c3cd762d418')
sha256sums_aarch64=('64e8f68f26eb1de81f0696a9a0fca7564c4e7e551de6cc98efc327ca02b56b52')

package() {
  install -vDm755 "${srcdir}/lk" -t "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin"
  ln -s lk "livekit-cli"
}
