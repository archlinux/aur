# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-incremental
pkgver=22.10.0
pkgrel=1
pkgdesc='A small library that versions your Python projects'
arch=('any')
license=('MIT')
depends=('python38-click' 'python38-setuptools' 'python38-twisted')
url='https://github.com/hawkowl/incremental'
checkdepends=('python38-pytest')
source=("https://github.com/hawkowl/incremental/archive/incremental-$pkgver.tar.gz")
sha512sums=('fbc0b123038341a788789aa513c93dfa08592881ea89aafebdd5b21917a9888f7a7d54d7765c105eb362559391ef45f15d8ef98278b0e75c84fce7d83febf5f0')

build() {
  cd incremental-incremental-$pkgver
  python3.8 setup.py build
}

check() {
  cd incremental-incremental-$pkgver
  pytest
}

package() {
  cd incremental-incremental-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
