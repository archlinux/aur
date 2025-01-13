# Maintainer: Fazlul Shahriar <fshahriar@gmail.com>

pkgname=python-kasa
pkgver=0.9.0
pkgrel=1
pkgdesc="Python library to control TPLink's smart home devices (plugs, wall switches, power strips, and bulbs)."
arch=('any')
url="https://github.com/python-kasa/python-kasa"
license=('GPL')
depends=('python-asyncclick' 'python-cryptography' 'python-aiohttp' 'python-mashumaro')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
checkdepends=()
source=("https://github.com/python-kasa/python-kasa/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('2ebc949bc3cf2dca6f30328ac18952d29057de40d2c93bf4b4d15e09fda9845bd768f794d2e0b0ee183a8e131c64b9c8c7c2f0c4ce8827b6f9c3ba4513184203')

build() {
  cd python-kasa-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd python-kasa-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
