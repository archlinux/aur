# Maintainer: typechecks
pkgname=anitui-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="a tui for browsing and streaming anime (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/typechecks/anitui"
license=('GPL-3.0-only')
provides=('anitui')
conflicts=('anitui')
optdepends=(
  'mpv: media player for streaming'
  'vlc: media player for streaming'
  'haruna: media player for streaming'
)

source_x86_64=("${pkgname}-${pkgver}-linux-amd64.tar.gz::https://github.com/typechecks/anitui/releases/download/v${pkgver}/anitui_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-linux-arm64.tar.gz::https://github.com/typechecks/anitui/releases/download/v${pkgver}/anitui_linux_arm64.tar.gz")
sha256sums_x86_64=('e1416c3ae99cc6c46a13c7969d52a162a7bf7285e53e27790e719163fa0405a2')
sha256sums_aarch64=('97da52e947d7b706abfa0500980583c262c90cb8a286f8e7e06a4d3627ed2aa5')

package() {
  install -Dm755 anitui "${pkgdir}/usr/bin/anitui"
  install -Dm644 /dev/null "${pkgdir}/usr/share/anitui/.package-manager"
}
