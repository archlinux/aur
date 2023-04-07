# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=liteiclink
pkgname=python-$_pkgname
pkgver=2021.08
pkgrel=2
pkgdesc='Small footprint and configurable Inter-Chip communication cores'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex')
makedepends=('python-setuptools')
#checkdepends=('python-pytest-runner') # no litescope release
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('f83ac3bdb3fe8a2e5926caba67d18d73287bffd87cb008b245b80b1be2942f5b9c2a66c0a44fc0556342ea4e4c2058bd437a50a27e9704b9f4a6b528465e3869')

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
