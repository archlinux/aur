# Maintainer: Althorion <althorion <at> protonmail <dot> com>

pkgname=python-aocd
_name=advent-of-code-data
pkgver=2.0.1
pkgrel=3
pkgdesc="Get your AOC puzzle data with a single import"
arch=('any')
url='https://github.com/wimglenn/advent-of-code-data'
license=('MIT')
depends=(python python-beautifulsoup4 python-pebble python-urllib3 python-aocd-example-parser)
makedepends=(python-build python-installer python-wheel)
# checkdepends=()
optdepends=('python-browser-cookie3: aocd-token script')
source=("https://github.com/wimglenn/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9d1978202f58948a26d6073a85b4571a18456b6c4f3b0a7186ff99fb1174710b')
b2sums=('c3b16d89a3b673cbff54bd2f49b34b69648f1af8fc7e955830a31d7fb0820f41b52ff5c32bf4c1ad0ac25efb3f209e169e0f67abed3c70a4c1c121bf337853ca')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
