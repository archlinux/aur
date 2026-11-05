# Maintainer: Margot Prego <mopigames@proton.me>

pkgname=spotify-soloist-bin
pkgver=1.3.10.46
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
sha256sums_x86_64=('b3c8d4bf2186754a1168b1e793dcd631c337a3062d1ffc9a4882f2d3a7fe6706')
sha256sums_aarch64=('94fc6cd375cbe228fe60f07db6e77667a52ac2b2cf2c5ada71f849deb246bedf')
sha256sums_armv7h=('e48d53eae275aa4c546e91f8531954c680227125b7d6d1bd58e7dc2a564c2a52')

package() {
  install -Dm755 soloist "${pkgdir}/usr/bin/soloist"
  install -Dm644 TERMS.md "${pkgdir}/usr/share/licenses/${pkgname}/TERMS.md"
}
