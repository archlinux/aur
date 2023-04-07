# Maintainer: Balló György <ballogyor+arch at gmail dot com>

_pkgname=getkey
pkgname=python-getkey
pkgver=0.6.5
pkgrel=4
pkgdesc='Python library to easily read single chars and key strokes'
arch=('any')
url='https://github.com/kcsaff/getkey'
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'flake8')
checkdepends=('python-pytest-cov')
source=("https://github.com/kcsaff/$_pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('096792463ed0cd8ac92d7b2b6d23cff1c815b449403115034bed2029b378d54c')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

check() {
  cd $_pkgname-$pkgver
  pytest
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
