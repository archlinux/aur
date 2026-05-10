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
sha256sums_x86_64=('305256e4d2c918924e92b081d39fa4235dfb14025e504a7be0d1bc77a67bf630')
sha256sums_aarch64=('a8ca5e9c9649038b4354545b0da1e1b7e1c9ef5203dfeb8dc72e250eb2b8c233')

package() {
  install -Dm755 anitui "${pkgdir}/usr/bin/anitui"
  install -Dm644 /dev/null "${pkgdir}/usr/share/anitui/.package-manager"
}
