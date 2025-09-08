# Maintainer: XavierCLL

pkgname=python-rios
pkgver=2.0.8
pkgrel=1
pkgdesc="A set of Python modules which makes it easy to write raster processing code in Python. Built on top of GDAL."
arch=('any')
url="https://www.rioshome.org"
license=('GPLv3')
depends=('python' 'python-numpy' 'gdal')
makedepends=('python-setuptools')
source=("https://github.com/ubarsc/rios/releases/download/rios-$pkgver/rios-$pkgver.tar.gz")
sha256sums=('9bc8adf0ce50546cc9c2241f93b47f5d7584be7a5a346f11cf696ec4a6c80498')

build() {
    cd rios-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd rios-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
