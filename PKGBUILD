# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-transforms3d
pkgdesc="3 dimensional spatial transformations for Python"
pkgver=0.3.1
pkgrel=1
url="https://matthew-brett.github.io/transforms3d/"
arch=('any')
depends=('python-numpy>=1.5')
license=('BSD')
source=("https://github.com/matthew-brett/transforms3d/archive/${pkgver}.tar.gz")
sha256sums=("6d83c9051b3b1a92a4ce884bad102f4079b3abfe1b186dca7a65ea871f82665d")

build() {
    cd "transforms3d-${pkgver}"
    python setup.py build
}

package() {
    cd "transforms3d-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
