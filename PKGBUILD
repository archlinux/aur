# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litevideo
pkgname=python-$_pkgname
pkgver=2020.08
pkgrel=3
pkgdesc='Small footprint and configurable video cores'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('99ba96249fc94d640e8a004759636ba5c6c02fcbb8d711041c14b59c1dafa9325231a945b6e10253cdcf7f3e0152fd18e16f6af052a013bb99282ee4f3ba497d')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
