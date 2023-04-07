# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litedram
pkgname=python-$_pkgname
pkgver=2021.08
pkgrel=2
pkgdesc='Small footprint and configurable DRAM core'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex' 'python-yaml')
makedepends=('python-setuptools')
#checkdepends=('python-pytest-runner' 'python-numpy' 'python-liteiclink') # missing pythondata-cpu-vexriscv release
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('e84cefc357a31e8e421f9a39d0eeb26d3b3da300ccbcebe6cf907fa4c2465e07a819fff3e4368e1fd2b726a17b91dfd4e36d1ce954ddf2e5b338a4ac373bc003')

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
