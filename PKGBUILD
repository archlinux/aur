# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=fate
_pkgname=fate_casino
pkgver=0.3.2
pkgrel=1
pkgdesc='Pull makes happy!'
arch=(any)
url=https://github.com/vEnhance/fate-casino
license=(MIT)
depends=(python python-tomli python-gitpython python-tomli python-tomlkit)
optdepends=(fd)
makedepends=(python-hatchling)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
  LICENSE)

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
b2sums=('8d67e640534d5bd4ea9959ef15abde13ad8ebb849042d2a7c2971676c3928e385d1c6cce965704fc8c1c2b92032d55a25894d0f3b1668edb58cddf7769dfcee1'
        'a9ba3ec0d6bf43ad3cb91fee61fec6d6c2cd30e95d40b8d4e2ec13839ffb1ee3a4f49a3f03f0b1d55da98cee9bbc75ac124698f5a9c9ecab65a65578c3410be7')
