# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=shaq
pkgver=0.0.3
pkgrel=1
pkgdesc='A bare-bones Shazam CLI client'
arch=(any)
url='https://github.com/woodruffw/shaq'
license=('MIT')
depends=('python>=3.10'
         'python-pyaudio>=0.2.13'
         'python-pydub>=0.25.1'
         'python-rich>=13.4'
         'python-shazamio>=0.6.0')
makedepends=(python-build 'python-flit-core>=3.2' python-installer python-wheel)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('e5654996403984117bebe9c47e24dbc0729a9a8b1d841db5aa3f32fa2581e5dc92bf1bfb59313d4940576ba0fa1d1c750a163ab6c53e31b04f2151698f014ac4')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
