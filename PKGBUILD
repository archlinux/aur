# Maintainer: a2sc <a_dev at a2sc eu>
# Contributor: livekit project
#
# Arch Linux PKGBUILD for livekit
# https://github.com/livekit

pkgname=livekit-cli-bin
pkgver=2.18.8
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

source_armv7h=(
    "https://github.com/livekit/livekit-cli/releases/download/v${pkgver}/lk_${pkgver}_linux_arm.tar.gz"
)

sha256sums_x86_64=('3e0977d0385d2f220d7f455105ac52f8035f79e70aecdf70b6dc054179905c7c')
sha256sums_aarch64=('0647dc8cc30e82d7a8d99a35faa893cf3883dbac52006dbd232114b1b9853513')

package() {
  install -vDm755 "${srcdir}/lk" -t "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin"
  ln -s lk "livekit-cli"
}
