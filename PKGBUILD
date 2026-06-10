# Maintainer: typechecks
pkgname=anitui-bin
pkgver=0.2.2
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
sha256sums_x86_64=('acf78c1936b7e5413e1adfcb71ab28b93174bf73169dd84178ea7b9a7cd773d9')
sha256sums_aarch64=('80b6f286495fff6063e80bf3cbc48b7fb5a07ba8ea0416538d0cfeec138537df')

package() {
  install -Dm755 anitui "${pkgdir}/usr/bin/anitui"
  install -Dm644 /dev/null "${pkgdir}/usr/share/anitui/.package-manager"
}
