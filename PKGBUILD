# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=borse
pkgver=0.3.0
pkgrel=2
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
sha256sums=('503e086e168bc3a8bed7b8d208430dbbc15042edc9097f446ba053c17d324d27'
  '82af9d0f8e6e2acd6c36b1426eb1d70bc3e9b16a126ae20fcd4f8d1101e64c47')
