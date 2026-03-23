# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=fate
_pkgname=fate_casino
pkgver=0.2.0
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
sha256sums=('b8a39f755c6a8a24ec3cba16fdb53118594a612548239b523a22da226c6b32d9'
            '82af9d0f8e6e2acd6c36b1426eb1d70bc3e9b16a126ae20fcd4f8d1101e64c47')
