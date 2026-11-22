# Maintainer: Twilight0 <twilight0@vivaldi.net>
pkgname=yt-tui
pkgver=1.3.0
pkgrel=1
pkgdesc="Curses TUI for yt-dlp with search and queueing"
arch=('any')
url="https://github.com/Twilight0/yt-tui"
license=('MIT')
depends=('python' 'yt-dlp' 'ffmpeg')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('mpv: video and native audio playback'
            'alsa-utils: ALSA audio playback and amixer volume control'
            'libpulse: PipeWire/PulseAudio playback and volume control'
            'bluez-alsa: Bluetooth A2DP volume control')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Twilight0/yt-tui/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d3e6975adfd2efe5c20fa16ea5291f7df0092fe7816cd88fb0b85955920b2e35')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
