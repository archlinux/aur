# Maintainer: Margot Prego <mopigames@proton.me>

pkgname=spotify-soloist-bin
pkgver=1.3.10.27
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
sha256sums_x86_64=('055d75d355cb54797e4e7016f6fbed8b9db84ca5a04741435365d15e135721dd')
sha256sums_aarch64=('58dbf956ad36bdbaf2e5c7e570267185d5df134b62346877eed5235c12bec032')
sha256sums_armv7h=('123754fa8d98967c81a8ebbe7f4a8405175415159462b19996d7eab208ed3279')

package() {
  install -Dm755 soloist "${pkgdir}/usr/bin/soloist"
  install -Dm644 TERMS.md "${pkgdir}/usr/share/licenses/${pkgname}/TERMS.md"
}
