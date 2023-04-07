# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litesata
pkgname=python-$_pkgname
pkgver=2021.08
pkgrel=2
pkgdesc='Small footprint and configurable SATA core'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex')
makedepends=('python-setuptools')
# checkdepends=('python-pytest-runner') # missing litescope release
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('d7590b504633ed11bdd193a76184d0bf81b8a03b04c079134e25b3ee21169fae3bae7f4f099709000b4bcf6f78d8eee42a2147bcb80a2cf0e5bc94f9fed5c33c')

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
