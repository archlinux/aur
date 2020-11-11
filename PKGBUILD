# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=sphinx-typlog-theme
pkgname=python-$_pkgname
_commit=f8f82b66e9c4ec9522fc08fdb77c0ae21500e12a
pkgver=0.8.0
pkgrel=3
pkgdesc='A sphinx theme by Typlog'
arch=('any')
url='https://github.com/typlog/sphinx-typlog-theme'
license=('custom:BSD-3-Clause')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('b2d2b4df4b69de333c82025ef3084016fe4ca7b67226dc3c230451affee24a75045db2962ec9080ce3748bbab5a47037bf8fb665441fda9e8adf0343ee066d05')

build() {
  cd $_pkgname-$_commit

  python setup.py build
}

package() {
  cd $_pkgname-$_commit

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
