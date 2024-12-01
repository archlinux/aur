# Maintainer: XavierCLL

pkgname=python-rios
pkgver=2.0.5
pkgrel=1
pkgdesc="A set of Python modules which makes it easy to write raster processing code in Python. Built on top of GDAL."
arch=('any')
url="https://www.rioshome.org"
license=('GPLv3')
depends=('python' 'python-numpy' 'gdal')
makedepends=('python-setuptools')
source=("https://github.com/ubarsc/rios/releases/download/rios-$pkgver/rios-$pkgver.tar.gz")
sha256sums=('4bd19c5e08dd03a0552fa4a7081597cd4915e47b938aef7f9a6be2c0da9aeb41')

build() {
    cd rios-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd rios-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
