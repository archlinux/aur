# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litesata
pkgname=python-$_pkgname
pkgver=2020.04
pkgrel=1
pkgdesc='Small footprint and configurable SATA core'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex')
makedepends=('python-setuptools')
# checkdepends=('python-pytest-runner') # missing litescope release
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('a7c1f8a39589e30b77bb82280f61c0c6fabf6f5bb3b7468db30ce13cc1de8bcb16da1e8cbec1829bc14ee604ca80704a51d973a253bac4a42b4b50a514dfb735')

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

