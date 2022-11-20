# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=linkify-it-py
pkgname=python38-$_pkgname
pkgver=2.0.0
pkgrel=1
pkgdesc='Links recognition library with full unicode support'
arch=('any')
url='https://github.com/tsutsu3/linkify-it-py'
license=('MIT')
depends=('python38-uc-micro-py')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools' 'python38-wheel')
checkdepends=('python38-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('7d2a66d5f0e33aece5b8d2737f20bd83f6cb2b7958b681c293f5996263f65f525862ce0cb0f7be9df1597844e58ed804b5b604c257e4d84cbf05677fd2733dda')

build() {
  cd $_pkgname-$pkgver

  python3.8 -m build
}

check() {
  cd $_pkgname-$pkgver

  python3.8 -m pytest
}

package() {
  cd $_pkgname-$pkgver

  python3.8 -m installer -d "$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
