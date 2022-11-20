# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=uc.micro-py
pkgname=python38-uc-micro-py
pkgver=1.0.1
pkgrel=3
pkgdesc='Micro subset of unicode data files for linkify-it-py projects'
arch=('any')
url='https://github.com/tsutsu3/uc.micro-py'
license=('MIT')
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('c6747943bd4ac9a3b7bf8d02a52947df04d4d4986311da7fa77d6ae010d512de9ad429d78a436a2f8e11c6f2d8dde00bea70ea0b1237a35e5b16ed4ad6b430fe')

build() {
  cd $_pkgname-$pkgver

  python3.8 setup.py build
}

check() {
  cd $_pkgname-$pkgver

  python3.8 -m pytest
}

package() {
  cd $_pkgname-$pkgver

  python3.8 setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
