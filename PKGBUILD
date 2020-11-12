# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litesata
pkgname=python-$_pkgname
pkgver=2020.08
pkgrel=3
pkgdesc='Small footprint and configurable SATA core'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex')
makedepends=('python-setuptools')
# checkdepends=('python-pytest-runner') # missing litescope release
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('f83edde55719db976ace2ca066e5685773244fdab44c82dd4a91b98200dc3ba56f1cd0d66eee2e521b37655888f6a6da27e25fd71a2229be9864d463118ffbf0')

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
