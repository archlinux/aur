# Maintainer: tarball <bootctl@gmail.com>

pkgname=music-player-bin
pkgver=0.2.0_alpha.13
pkgrel=1
pkgdesc='An extensible music server written in Rust'
url='https://github.com/tsirysndr/music-player'
arch=(x86_64 armv7h aarch64)
license=(MIT)
provides=(music-player)
conflicts=(music-player)
depends=(glibc alsa-lib gcc-libs)

source=(music-player.service)
source_x86_64=("$url/releases/download/v${pkgver/_/-}/music-player_v${pkgver/_/-}_x86_64-unknown-linux-gnu.tar.gz")
source_armv7h=("$url/releases/download/v${pkgver/_/-}/music-player_v${pkgver/_/-}_armv7-unknown-linux-gnueabihf.tar.gz")
source_aarch64=("$url/releases/download/v${pkgver/_/-}/music-player_v${pkgver/_/-}_aarch64-unknown-linux-gnu.tar.gz")

sha256sums=('baf06a790cf152622a3f19c707805db724cd6a55a3398df45146feb62ff501f3')
sha256sums_x86_64=('de41b7bc537d239d8bfb78c1454055a31ccc44d1f4429450644f4c2d820b42fc')
sha256sums_armv7h=('032e49558aea44380ffbdb18e0199631689b09c23105b755bc0c958b7d0cdcd6')
sha256sums_aarch64=('9c9953a8c980aa2e83cc8fca386ae3dd76ea9539990926ed7eac7394187ce0a9')

package() {
  install -Dm755 music-player \
    "$pkgdir"/usr/bin/music-player

  install -Dm644 music-player.service \
    "$pkgdir"/usr/lib/systemd/user/music-player.service
}
