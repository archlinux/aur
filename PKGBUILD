# Maintainer: gilcu3
# Previous Maintainer: portaloffreedom

_pkgname=wolframalpha
pkgname=python-$_pkgname
pkgver=5.0.0
pkgrel=1
pkgdesc="Wolfram|Alpha 2.0 API client"
url="https://github.com/jaraco/wolframalpha"
license=("MIT")
arch=("any")
depends=('python' 'python-six' 'python-xmltodict')
source=($url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('16098fff0f299bb97cbd241f31c8b844479e9cd210015e530e3e022b312c1c17')


build() {
  cd $srcdir/${_pkgname}-$pkgver
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $srcdir/${_pkgname}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}



