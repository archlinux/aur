pkgname=sip-6.7
_pkgname=sip
pkgver=6.7.12
pkgrel=1
arch=(x86_64)
pkgdesc='The version of the tool that makes it easy to create Python bindings for C and C++ libraries'
url='https://www.riverbankcomputing.com/software/sip/intro'
license=('custom:"sip"')
provides=('sip=6.7.12')
conflicts=(sip)
depends=(
    python-toml 
    python-packaging 
    python-setuptools 
    python-ply
)
makedepends=(
    python-build 
    python-installer 
    python-wheel
)
source=(https://pypi.python.org/packages/source/s/sip/$_pkgname-$pkgver.tar.gz)
sha256sums=('08e66f742592eb818ac8fda4173e2ed64c9f2d40b70bee11db1c499127d98450')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
