# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=aiohttp-cors
pkgname=python-aiohttp-cors
pkgver=0.7.0
pkgrel=5
pkgdesc='CORS support for aiohttp'
depends=('python-aiohttp')
makedepends=('python-setuptools')
arch=('any')
url=https://github.com/aio-libs/aiohttp-cors
license=('Apache')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4d39c6d7100fd9764ed1caf8cebf0eb01bf5e3f24e2e073fda6234bc48b19f5d')

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
