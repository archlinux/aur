# Maintainer: Margot Prego <mopigames@proton.me>

pkgname=spotify-soloist-bin
pkgver=1.3.10.42
pkgrel=1
pkgdesc='Official headless Spotify Connect client for Linux and Raspberry Pi'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://developer.spotify.com/documentation/soloist'
license=('LicenseRef-Spotify-Terms')
depends=('glibc' 'libatomic' 'libpipewire' 'libpulse')
optdepends=(
  'pipewire: PipeWire audio server'
  'pipewire-pulse: PulseAudio compatibility when using PipeWire'
  'pulseaudio: PulseAudio server'
)
provides=('spotify-soloist')
conflicts=('spotify-soloist')
options=('!debug' '!strip')

source=('TERMS.md')
source_x86_64=("spotify-soloist-${pkgver}-x86_64.tar.gz::https://soloist-builds.spotifycdn.com/soloist_release_x86_64.tar.gz")
source_aarch64=("spotify-soloist-${pkgver}-aarch64.tar.gz::https://soloist-builds.spotifycdn.com/soloist_release_arm64.tar.gz")
source_armv7h=("spotify-soloist-${pkgver}-armv7h.tar.gz::https://soloist-builds.spotifycdn.com/soloist_release_arm32.tar.gz")
sha256sums=('77d3c4f26593c9ba58ce4b8528e3fbe40cf7c718b222c0b7d500357bfbae04f9')
sha256sums_x86_64=('442c58baf3de81095673157b3a2470d578930a4696aca16ebc6f3bc07c799243')
sha256sums_aarch64=('e60f4c6501eb22c31823c0954d1ab1beaa0f44e28a864307ea49b5115185a566')
sha256sums_armv7h=('5955297ca1d6ccc74fee30f98effc3cf42c8ee0faa3143cd2fb4ad2b59d951b7')

package() {
  install -Dm755 soloist "${pkgdir}/usr/bin/soloist"
  install -Dm644 TERMS.md "${pkgdir}/usr/share/licenses/${pkgname}/TERMS.md"
}
