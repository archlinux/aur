# Maintainer: Althorion <althorion <at> protonmail <dot> com>

pkgname=python-aocd-example-parser
_name=${pkgname#python-}
pkgver=2023.2
pkgrel=1
pkgdesc="Implementation of example parser plugins for advent-of-code-data"
arch=('any')
url='https://github.com/wimglenn/aocd-example-parser'
license=('MIT')
depends=(python)
makedepends=(python-build python-installer python-wheel python-flit-core)
# checkdepends=()
source=("https://github.com/wimglenn/$_name/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ef388d07012ed3bca8b84a7700642f581b93d94bbacd6ec9dfe6b2fb44f97148')
b2sums=('417f7e43182fd37ecc85b6d7c907bff0ee4f6b22f65760e6ad18b9d6ddc8ebb39a8e22df086851cc1f3f75c3272e6a94a1016a44028eb67600afe3bea6e650b5')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

