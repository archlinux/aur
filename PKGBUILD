# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=borse
pkgver=0.2.0
pkgrel=1
pkgdesc='Practice braille, Morse, semaphore.'
arch=(any)
url=https://github.com/vEnhance/borse
license=(MIT)
depends=(python)
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
sha256sums=('5c3dcba61dcdd120042be1a1aadb3a7ae37e7651697de383b5f6e046a74f7c50'
            '82af9d0f8e6e2acd6c36b1426eb1d70bc3e9b16a126ae20fcd4f8d1101e64c47')
