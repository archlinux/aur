# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litevideo
pkgname=python-$_pkgname
pkgver=2020.04
pkgrel=1
pkgdesc='Small footprint and configurable video cores'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('b50719b6a0e1d24db9b6a7802de012ea423735793dd1699493b1ae82831fe9310e2011c3e505e437340410ab2a3f5d04d165bf36f604c6f1931ee27cad369fcc')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

