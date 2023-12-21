pkgname=python-sip
pkgver=6.8.1
pkgrel=1
arch=(x86_64)
pkgdesc='A tool that makes it easy to create Python bindings for C and C++ libraries'
url='https://www.riverbankcomputing.com/software/sip/intro'
license=('custom:"sip"')
provides=(sip python-sip)
conflicts=(sip python-sip)
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
source=(https://pypi.python.org/packages/source/s/sip/sip-$pkgver.tar.gz)
sha256sums=('3002df415e168ac3ffe393942dbc7131cb82ade50000e1526f46a88ade26f598')

build() {
  cd sip-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd sip-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
