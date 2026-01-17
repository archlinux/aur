# Maintainer: HeadedBranch <isaac.hesslegrave at gmail dot com>

pkgname=python-asciify-them
_name=${pkgname#python-}
pkgver=1.0.4
pkgrel=1
pkgdesc="Allows you to turn images into ASCII art drawings"
arch=(any)
license=("MIT")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
url="https://github.com/ndrscalia/asciify-them"
sha256sums=('8b1dc5998e62ea07a1e1d4094c9ee3c69e157ede90eb77a9eeae3306d07f85b0')
makedepends=(python-build python-installer python-wheel)
depends=(python-opencv)
_filename=asciify_them # Because this is what the source file is named for some reason

build() {
  cd $_filename-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_filename-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
