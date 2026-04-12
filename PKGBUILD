# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=borse
pkgver=0.6.1
pkgrel=1
pkgdesc='Practice braille, Morse, semaphore.'
arch=(any)
url=https://github.com/vEnhance/borse
license=(MIT)
depends=(python python-tomli-w)
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
sha256sums=('7bd1c6e340edde6a033d79688fa5797fd926646c8480d12ec89028285439372c'
            '82af9d0f8e6e2acd6c36b1426eb1d70bc3e9b16a126ae20fcd4f8d1101e64c47')
