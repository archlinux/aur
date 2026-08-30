# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=borse
pkgver=0.7.0
pkgrel=1
pkgdesc='Practice braille, Morse, semaphore.'
arch=(any)
url=https://github.com/vEnhance/borse
license=(MIT)
depends=(python python-tomli-w python-pyperclip)
makedepends=(python-hatchling)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
  LICENSE)

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
b2sums=('8bd70122d44aed2211621d3308cacc86309e618d19bdc4bce6a0d17759bd82214f03801c84f3ed07bd5e7a5afbb6478d9fd8d23ed6d6760bd10c8c9d7093572e'
        'a9ba3ec0d6bf43ad3cb91fee61fec6d6c2cd30e95d40b8d4e2ec13839ffb1ee3a4f49a3f03f0b1d55da98cee9bbc75ac124698f5a9c9ecab65a65578c3410be7')
