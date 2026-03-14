# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-throttler
_name=${pkgname#python-}
pkgver=1.2.3
pkgrel=1
pkgdesc='Zero-dependency Python package for easy throttling with asyncio support'
arch=('any')
url="https://github.com/uburuntu/throttler"
license=('MIT')
depends=('python')
makedepends=(python-build python-installer python-wheel)
checkdepends=('python-pytest>=3.0')
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('3bdf235ed8eb70d68b900bdc35daa854fd5981c298f8de0fb848a42d61f78774')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
