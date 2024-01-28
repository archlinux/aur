# Maintainer: Ben 'silentnoodle' Lönnqvist <lonnqvistben at gmail dot com>

pkgname=python-aiohttp-security
pkgdesc='auth and permissions for aiohttp'
pkgver=0.5.0
pkgrel=1
url='https://aiohttp-security.readthedocs.io'
license=('Apache')
arch=('any')
depends=('python-aiohttp')
makedepends=('python-setuptools')
source=(
  "https://files.pythonhosted.org/packages/source/a/aiohttp-security/aiohttp-security-$pkgver.tar.gz"
)

sha256sums=('50cb724d310e1d0289798bb98ae852c3b75b77e8f51ce5159c57b7261d0638bd')

build() {
  cd "aiohttp-security-$pkgver"
  python setup.py build
}

package() {
  cd "aiohttp-security-$pkgver"
  python setup.py install --skip-build --optimize=1 --prefix=/usr --root="$pkgdir"
}
