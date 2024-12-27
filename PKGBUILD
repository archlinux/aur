# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-throttler
_name=${pkgname#python-}
pkgver=1.2.2
pkgrel=3
pkgdesc='Zero-dependency Python package for easy throttling with asyncio support'
arch=('any')
url="https://github.com/uburuntu/throttler"
license=('MIT')
depends=('python')
makedepends=(python-build python-installer python-wheel)
checkdepends=('python-pytest>=3.0')
source=($_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('753bf1954f8580ca6ea7a9787dbacbe29f0da8fb32598a2386a3f04497d00ad9')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
