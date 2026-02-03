# Maintainer: Deon Spengler <deon@spengler.co.za>

pkgname=python-aubio-ledfx
pkgver=0.4.11
pkgrel=1
pkgdesc="Library to listen to audio signals and attempts to detect events"
arch=('x86_64')
url="https://github.com/LedFx/aubio-ledfx"
license=('GPL-3.0-only')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'meson-python')
source=("https://github.com/LedFx/aubio-ledfx/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a07df9ce3da2d328dbfaf30836c04c3619bc16f27b2a2ba33a924c3f11a0723f')

build() {
    cd "aubio-ledfx-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "aubio-ledfx-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
