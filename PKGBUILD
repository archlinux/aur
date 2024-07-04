# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Clint Valentine <valentine.clint@gmail.com>
pkgname=python-pybigwig
_name=pyBigWig
pkgver=0.3.23
pkgrel=1
pkgdesc="A Python extension for quick access to bigWig and bigBed files"
arch=(any)
url=https://github.com/deeptools/pyBigWig
license=('MIT')
depends=(curl python-numpy)
makedepends=(python-build python-installer python-wheel)
options=(!emptydirs)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('2f3fbac5c329c7d30b78ae72aabcfecdb6bf8da287169710577887d5e14682b3')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
