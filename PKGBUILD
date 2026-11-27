# Maintainer: Twilight0 <twilight0@vivaldi.net>
pkgname=radio-tui
pkgver=1.2.1
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
sha256sums=('c56f730d2e0d59577083aa92dab4e6d9807cf41c943ee6a46ad30366cfd569f7')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
