# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-cachetools
pkgver=5.2.0
pkgrel=1
pkgdesc="Extensible memoizing collections and decorators"
url="https://github.com/tkem/cachetools"
license=('MIT')
arch=('any')
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tkem/cachetools/archive/v$pkgver.tar.gz")
sha512sums=('ac290120e9f6430e372a4ce3ff6e43f636b2934ad452ecc0f3a05002ad6aaf17b245bbce0081f769f251094a8518dc0e8f04b3d9f3ab5b87f97c02e536598c83')

build() {
  cd "$srcdir"/cachetools-$pkgver
  python3.8 setup.py build
}

check() {
  cd "$srcdir"/cachetools-$pkgver
  python3.8 setup.py pytest
}

package() {
  cd cachetools-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
