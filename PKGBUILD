# Maintainer: Twilight0 <twilight0@vivaldi.net>
pkgname=radio-tui
pkgver=1.1.0
pkgrel=1
pkgdesc="Lightweight curses internet radio player"
arch=('any')
url="https://github.com/Twilight0/radio-tui"
license=('MIT')
depends=('python' 'ffmpeg' 'alsa-utils')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('libpulse: PipeWire/PulseAudio playback and volume control'
            'bluez-alsa: Bluetooth A2DP volume control')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Twilight0/radio-tui/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1ced2b6d07328d09a8df24ef85f52d5caed6363c4e7ea278f998b641f0957eb1')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
