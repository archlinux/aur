# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Clint Valentine <valentine.clint@gmail.com>
pkgname=python-pybigwig
_name=pyBigWig
pkgver=0.3.20
pkgrel=1
pkgdesc="A Python extension for quick access to bigWig and bigBed files"
arch=(any)
url=https://github.com/deeptools/pyBigWig
license=('MIT')
depends=(curl python-numpy)
makedepends=(python-build python-installer python-wheel)
options=(!emptydirs)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('ba63ffb302647a6bcda75187a9d8576bb249e37ae6e83379ddb31e22cd7a8c0b')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
