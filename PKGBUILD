# Maintainer: Randometerian <Randometerian@gmail.com>
pkgname=tuna-music
pkgver=1.1.0
pkgrel=1
pkgdesc="TUNA — Terminal music player with real-time audio visualizer"
arch=('x86_64')
url="https://github.com/randometerian/TUNA"
license=('MIT')
depends=(
    'python>=3.11'
    'mpv'
    'python-mutagen'
    'python-pillow'
    'python-numpy'
    'python-pyaudio'
    'portaudio'
)
makedepends=(
    'python-setuptools'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/randometerian/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    pip install --prefix="$srcdir/.deps" -e .
}

package() {
    cd "$pkgname-$pkgver"
    pip install --root="$pkgdir" --optimize=1 -e .
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}