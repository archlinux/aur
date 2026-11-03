# Maintainer: Margot Prego <mopigames@proton.me>

pkgname=spotify-soloist-bin
pkgver=1.3.10.38
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
sha256sums_x86_64=('a14aeb143ba627547a1d7c38c70db082f6be6da084f6d1b240890d539e24c3e7')
sha256sums_aarch64=('c4a1fe0381713f427da6759e94caf62d3e4e8c3e5f7a03c2b951cda1cf9adb95')
sha256sums_armv7h=('ba0b25247d8f126b8d99e3034ec2698d69258ba76851054c549f9018962d85d7')

package() {
  install -Dm755 soloist "${pkgdir}/usr/bin/soloist"
  install -Dm644 TERMS.md "${pkgdir}/usr/share/licenses/${pkgname}/TERMS.md"
}
