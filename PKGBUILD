# Maintainer: Twilight0 <twilight0@vivaldi.net>
pkgname=radio-tui
pkgver=1.1.1
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
sha256sums=('cdea4da6be1bcadde83de7163d15e683cee79560b9d589d4956f9e2461ee002b')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
