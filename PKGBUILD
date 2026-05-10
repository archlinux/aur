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
sha256sums_x86_64=('8dbdd9d15e0f5743ec4c58d30d3ef6b9bc902505184485a9d62e2cb94201886d')
sha256sums_aarch64=('32f967bbcd1769c6536a17a8b90bc752c8e2648be457d50312c8ab9b99b46c7a')

package() {
  install -Dm755 anitui "${pkgdir}/usr/bin/anitui"
  install -Dm644 /dev/null "${pkgdir}/usr/share/anitui/.package-manager"
}
