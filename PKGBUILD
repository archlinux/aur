pkgname=sip-pre-release
pkgver=6.8.2
pkgrel=1
arch=(x86_64)
pkgdesc='The pre-release version of the tool that makes it easy to create Python bindings for C and C++ libraries'
url='https://www.riverbankcomputing.com/software/sip/intro'
license=('custom:"sip"')
provides=(sip)
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
source=(https://www.riverbankcomputing.com/pypi/packages/sip/sip-6.8.2.dev2312122232.tar.gz)
md5sums=('SKIP')  # changing everyday

_dir=sip-6.8.2.dev2312122232
build() {
  cd $_dir
  python -m build --wheel --no-isolation
}

package() {
  cd $_dir
  python -m installer --destdir="$pkgdir" dist/*.whl
}
