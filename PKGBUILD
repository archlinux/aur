# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=aiohttp-openmetrics
pkgname=python-aiohttp-openmetrics
pkgver=0.0.3
pkgrel=1
pkgdesc='OpenMetrics provider for aiohttp'
arch=('any')
url=https://github.com/jelmer/aiohttp-openmetrics
license=('Apache')
depends=('python-aiohttp' 'python-prometheus_client')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('84f3ce52591cd84aa7fbd7d79f14d935e23948836d9aaf51c59807a4208d0b06')
b2sums=('aa2f903ace455feff726140bfda460e11bd9b64ed343125d7ea5bf66c20fe62d5f3996d36c08ebe1011fbf24e492dcc9665c09040f1c7cd1fd48baeacd362b3a')

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
