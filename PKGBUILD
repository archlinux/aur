# Maintainer: Ben 'silentnoodle' Lönnqvist <lonnqvistben at gmail dot com>

pkgname=python-aiohttp-security
pkgdesc='auth and permissions for aiohttp'
pkgver=0.4.0
pkgrel=1
url='https://aiohttp-security.readthedocs.io'
license=('Apache')
arch=('any')
depends=('python-aiohttp')
makedepends=('python-setuptools')
source=(
  "https://files.pythonhosted.org/packages/source/a/aiohttp-security/aiohttp-security-$pkgver.tar.gz"
)

sha256sums=('40d4bb150454e392c2dfa3620f6eab28e140e94cf0c2d3b4bf43aef653ec9405')

build() {
  cd "aiohttp-security-$pkgver"
  python setup.py build
}

package() {
  cd "aiohttp-security-$pkgver"
  python setup.py install --skip-build --optimize=1 --prefix=/usr --root="$pkgdir"
}
