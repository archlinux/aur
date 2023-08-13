# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=shaq
pkgver=0.0.1
pkgrel=1
pkgdesc='A bare-bones Shazam CLI client'
arch=(any)
url='https://github.com/woodruffw/shaq'
license=('MIT')
depends=(
    'python>=3.10'
    'python-pyaudio>=0.2.13'
    'python-pydub>=0.25.1'
    'python-rich>=13.4'
    'python-shazamio>=0.4.0.1'
)
makedepends=(
    python-build
    'python-flit-core>=3.2'
    python-installer
    python-wheel
)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('25defb296bba73d43907dea55461b31f840091975ea96855515a63ff0f81a3a2ef8e807a04d837e585f06f22225ad317c93b34d68e346e8b65e5a4903c6c4178')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
