# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litedram
pkgname=python-$_pkgname
pkgver=2020.08
pkgrel=3
pkgdesc='Small footprint and configurable DRAM core'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex' 'python-yaml')
makedepends=('python-setuptools')
#checkdepends=('python-pytest-runner' 'python-numpy' 'python-liteiclink') # missing pythondata-cpu-vexriscv release
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('d9dff553a2090d6124b23c44807c0407c118f2734b844fbcafc530eb089c187c874d5367c4cf9d1883e9d75bbd794f35ecd4b83331c9e7e2dd38b0434dadab55')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

check() {
  cd $_pkgname-$pkgver

#  python setup.py pytest
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
