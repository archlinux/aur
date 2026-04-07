# Maintainer: osdva <arthurvdinizs@gmail.com>
pkgname=qobuz-player-bin
_pkgname=qobuz-player
pkgver=0.9.0
pkgrel=1
pkgdesc='High resolution audio player backed by Qobuz (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/SofusA/qobuz-player'
license=('GPL-3.0-only')
depends=('alsa-lib' 'openssl' 'gcc-libs')
provides=("qobuz-player=${pkgver}")
conflicts=('qobuz-player' 'qobuz-player-git')
options=('!strip')

source=(
  "LICENSE::https://raw.githubusercontent.com/SofusA/qobuz-player/v${pkgver}/LICENSE"
)
source_x86_64=(
  "${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/SofusA/qobuz-player/releases/download/v${pkgver}/qobuz-player-x86_64-unknown-linux-gnu.tar.gz"
)
source_aarch64=(
  "${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/SofusA/qobuz-player/releases/download/v${pkgver}/qobuz-player-aarch64-unknown-linux-gnu.tar.gz"
)

sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('c762cbe66e4b44867266ec75c1d2c02767a8be1484b01db9e886dc32aef796aa')
sha256sums_aarch64=('07bb8556295fa317f6fc230c70865d86c146f6f7876ef26dc7431c181414cd91')

package() {
  install -Dm755 "${srcdir}/qobuz-player" "${pkgdir}/usr/bin/qobuz-player"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
