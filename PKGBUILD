# Maintainer: gilcu3
# Previous Maintainer: portaloffreedom

_pkgname=wolframalpha
pkgname=python-$_pkgname
pkgver=5.1.3
pkgrel=1
pkgdesc="Wolfram|Alpha 2.0 API client"
url="https://github.com/jaraco/wolframalpha"
license=("MIT")
arch=("any")
depends=('python' 'python-six' 'python-xmltodict')
source=($url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('2904733064f70dd1c9133e84fe5554729c07901216febb306c2207cb832f91ce')


build() {
  cd $srcdir/${_pkgname}-$pkgver
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $srcdir/${_pkgname}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}



