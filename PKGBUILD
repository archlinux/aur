# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litevideo
pkgname=python-$_pkgname
pkgver=2021.08
pkgrel=2
pkgdesc='Small footprint and configurable video cores'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('49cf97ab731badfeb51f7f892e53afa3b85515cc6f0086abf443cda3c4d4f2759f2d24bf7f2112010044412e8b07da99271d7b0d39308cac67afc826bd6e3c52')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
