# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=fate
_pkgname=fate_casino
pkgver=0.3.1
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
sha256sums=('7249aa5c1f7d251d40246d6c61be669a240fa3b11d609bb143747f5291159279'
            '82af9d0f8e6e2acd6c36b1426eb1d70bc3e9b16a126ae20fcd4f8d1101e64c47')
