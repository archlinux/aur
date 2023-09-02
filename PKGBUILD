# Maintainer: tarball <bootctl@gmail.com>

pkgname=music-player-bin
pkgver=0.2.0_alpha.14
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
sha256sums_x86_64=('d0940e1023d8b61960881e79544202f036624e37a019437706a9e472977f24d4')
sha256sums_armv7h=('1b189c0723dfc91b497c01003501bb27211c08ecaaf0043098b62858d62b80c2')
sha256sums_aarch64=('01c51230fe88794a4758a1c1e77db3c668b7af54914bb9cf3d19983b331314e3')

package() {
  install -Dm755 music-player \
    "$pkgdir"/usr/bin/music-player

  install -Dm644 music-player.service \
    "$pkgdir"/usr/lib/systemd/user/music-player.service
}
