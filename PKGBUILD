# Maintainer: tarball <bootctl@gmail.com>

pkgname=music-player-bin
pkgver=0.4.1
pkgrel=1
pkgdesc='An extensible music server written in Rust'
url='https://github.com/tsirysndr/music-player'
arch=(x86_64 aarch64)
license=(MIT)
provides=(music-player)
conflicts=(music-player)
depends=(glibc alsa-lib gcc-libs)

source=(music-player.service)
source_x86_64=("$url/releases/download/v${pkgver/_/-}/music-player_v${pkgver/_/-}_x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/v${pkgver/_/-}/music-player_v${pkgver/_/-}_aarch64-unknown-linux-gnu.tar.gz")

sha256sums=('baf06a790cf152622a3f19c707805db724cd6a55a3398df45146feb62ff501f3')
sha256sums_x86_64=('347b457d3ad99bc748edcfadf149f62084e72428680d127f466ea58cbd83c94b')
sha256sums_aarch64=('36b412c57c024debf3af1c83d12acc718134a03f63c3e14d256be98c9365802d')

package() {
  install -Dm755 music-player \
    "$pkgdir"/usr/bin/music-player

  install -Dm644 music-player.service \
    "$pkgdir"/usr/lib/systemd/user/music-player.service
}
