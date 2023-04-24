# Maintainer: tarball <bootctl@gmail.com>

pkgname=music-player-bin
pkgver=0.2.0_alpha.12
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
sha256sums_x86_64=('2c4c1eec31ed53fc6e9ec6e598f89173fc2d1adaf323b9c1f77be5be3e9cee6f')
sha256sums_armv7h=('730ab8eafb6e14b0c77e3eab735798496ea849b70a2fb73ac133ff987e220983')
sha256sums_aarch64=('b9f6a3d0b6820a17e62d61329fb67c04c4736eaebad76b08b34dadb243eb4959')

package() {
  install -Dm755 music-player \
    "$pkgdir"/usr/bin/music-player

  install -Dm644 music-player.service \
    "$pkgdir"/usr/lib/systemd/user/music-player.service
}
