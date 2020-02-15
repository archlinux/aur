# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=sphinx-typlog-theme
pkgname=python-$_pkgname
pkgver=0.7.3
pkgrel=1
pkgdesc='A sphinx theme by Typlog'
arch=('any')
url='https://github.com/typlog/sphinx-typlog-theme'
license=('custom:BSD-3-Clause')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('df2ae8aadd9aa598fac01678c209d421e5c1e6f0fb995f419b791c542a64de3e7eb710b9c271954adf5cebca46e36daf912fd6204a321d9ab807e851cca790a8')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
