# Maintainer: Fazlul Shahriar <fshahriar@gmail.com>

pkgname=python-kasa
pkgver=0.9.1
pkgrel=1
pkgdesc="Python library to control TPLink's smart home devices (plugs, wall switches, power strips, and bulbs)."
arch=('any')
url="https://github.com/python-kasa/python-kasa"
license=('GPL')
depends=('python-asyncclick' 'python-cryptography' 'python-aiohttp' 'python-mashumaro')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
checkdepends=()
source=("https://github.com/python-kasa/python-kasa/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('cba2b97089c2adcb231fbeb8a36cf85b2ac37839095f74679f144451463df83e5996dceab588556ef76730e67b256fe241005c717e644c84c8baaf88d8b7ef91')

build() {
  cd python-kasa-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd python-kasa-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
