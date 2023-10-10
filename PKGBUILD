pkgname=python-sip-pre-release
pkgver=6.7.12
pkgrel=1
arch=(x86_64)
pkgdesc='The pre-release version of the tool that makes it easy to create Python bindings for C and C++ libraries'
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
source=(https://www.riverbankcomputing.com/pypi/packages/sip/sip-6.7.12.tar.gz)
md5sums=('8f1b9d28c729124f8019fc580f42d510')

build() {
  cd sip-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd sip-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
