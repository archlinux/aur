# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Clint Valentine <valentine.clint@gmail.com>
pkgname=python-pybigwig
_name=pyBigWig
pkgver=0.3.21
pkgrel=1
pkgdesc="A Python extension for quick access to bigWig and bigBed files"
arch=(any)
url=https://github.com/deeptools/pyBigWig
license=('MIT')
depends=(curl python-numpy)
makedepends=(python-build python-installer python-wheel)
options=(!emptydirs)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('5bff713fe3f8840e0fbe48cf8c8fe9d92c8af8ba107da0b845076164445d076e')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
