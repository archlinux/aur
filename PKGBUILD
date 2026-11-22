# Maintainer: Twilight0 <twilight0@vivaldi.net>
pkgname=radio-tui
pkgver=1.0.0
pkgrel=2
pkgdesc="Lightweight curses internet radio player"
arch=('any')
url="https://github.com/Twilight0/radio-tui"
license=('MIT')
depends=('python' 'ffmpeg' 'alsa-utils')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('libpulse: PipeWire/PulseAudio playback and volume control'
            'bluez-alsa: Bluetooth A2DP volume control')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Twilight0/radio-tui/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('248e564b142c132ab808760d1c0a63a1ac8cb3d6686c3096362da961db84a729')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
