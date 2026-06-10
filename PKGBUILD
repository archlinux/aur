# Maintainer: typechecks
pkgname=anitui-bin
pkgver=0.2.1
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
sha256sums_x86_64=('99270add1b3bc9a26860aac67b4ae43a426d30657955e14d179ddd1672eaaa3b')
sha256sums_aarch64=('cdc4c7ef5bb3fb1e23b84e628f12e36a2e530b0b85d330b3b9685c2b82fc844b')

package() {
  install -Dm755 anitui "${pkgdir}/usr/bin/anitui"
  install -Dm644 /dev/null "${pkgdir}/usr/share/anitui/.package-manager"
}
