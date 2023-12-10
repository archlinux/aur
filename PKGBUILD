# Maintainer: Fazlul Shahriar <fshahriar@gmail.com>

pkgname=python-kasa
pkgver=0.5.4
pkgrel=1
pkgdesc="Python library to control TPLink's smart home devices (plugs, wall switches, power strips, and bulbs)."
arch=('any')
url="https://github.com/python-kasa/python-kasa"
license=('GPL')
depends=('python-asyncclick')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
checkdepends=()
source=("https://github.com/python-kasa/python-kasa/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('1f88717152dbd4af38e19309be84775e4540f4c344f3cf4d1b22e3779340e0108d89187fe0753f4d1d894227a451fe7dd6dc03ddb27bfde7807911173447a8a1')

build() {
  cd python-kasa-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd python-kasa-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
