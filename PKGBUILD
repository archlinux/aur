# Maintainer: Twilight0 <twilight0@vivaldi.net>
pkgname=radio-tui
pkgver=1.2.0
pkgrel=1
pkgdesc="Lightweight curses internet radio player"
arch=('any')
url="https://github.com/Twilight0/radio-tui"
license=('MIT')
depends=('python' 'ffmpeg' 'alsa-utils')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('libpulse: PipeWire/PulseAudio playback and volume control'
            'bluez-alsa: Bluetooth A2DP volume control'
            'curl: fallback for legacy SHOUTcast (ICY) streams on ffmpeg 9.1+'
            'yt-dlp: play manually added YouTube URLs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Twilight0/radio-tui/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('be04d2bc563dc405cfe46d514f2b150f2644db9d8470b45e67ae34cf2b1f7b6d')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
