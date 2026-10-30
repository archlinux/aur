# Maintainer: Margot Prego <mopigames@proton.me>

pkgname=spotify-soloist-bin
pkgver=1.3.10.31
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
sha256sums_x86_64=('0216c6d2b10a22570170f2381252c3a0997121113958877f9d8e9d9d1679c786')
sha256sums_aarch64=('b6ad23bfd9dfd3000357e5a80830abab5e7e8b2f4e6e68082e45b9bc518f9bb0')
sha256sums_armv7h=('57c87354de9f1a7bf53078874ec31ed9993d427676acbff57669c2ed8de671a1')

package() {
  install -Dm755 soloist "${pkgdir}/usr/bin/soloist"
  install -Dm644 TERMS.md "${pkgdir}/usr/share/licenses/${pkgname}/TERMS.md"
}
