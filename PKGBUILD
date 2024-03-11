# Maintainer: Fazlul Shahriar <fshahriar@gmail.com>

pkgname=python-kasa
pkgver=0.6.2.1
pkgrel=1
pkgdesc="Python library to control TPLink's smart home devices (plugs, wall switches, power strips, and bulbs)."
arch=('any')
url="https://github.com/python-kasa/python-kasa"
license=('GPL')
depends=('python-asyncclick')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core' 'python-async-timeout' 'python-pydantic')
checkdepends=()
source=("https://github.com/python-kasa/python-kasa/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('add61698cfdac53aa3cfe4a19d8237d493fe48141021187d321e30550d7969c1885e743466ec903ac8abddd4efc0f6857d8e2014972a8f937212116837b74751')

build() {
  cd python-kasa-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd python-kasa-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
