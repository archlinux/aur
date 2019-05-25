# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-first
pkgver=2.0.1
pkgrel=1
pkgdesc="Return the first true value of an iterable"
url="https://github.com/hynek/first"
license=('MIT')
arch=('x86_64')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hynek/first/archive/$pkgver.tar.gz")
sha512sums=('c0794fa6d6185a12ef51c39a5b659a4f09e22c6d7284a8f6f10a62fe0744e4158ced191dff6f160bffd83043a8bf76948214861e9c2341d5d231f6f9b6af19f4')

build() {
  cd first-$pkgver
  python setup.py build
}

check() {
  cd first-$pkgver
  python setup.py pytest
}

package() {
  cd first-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
