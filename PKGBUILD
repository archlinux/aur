# Maintainer: Pierre Chapuis <arch@catwell.info>

pkgname="johnnydep"
pkgver=1.20.5
pkgrel=1
pkgdesc="Display dependency tree of Python distribution"
arch=("any")
url="https://github.com/wimglenn/johnnydep"
license=("MIT")
options=(!emptydirs)
source=("$pkgname-src-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("f2ff31da327edb71a9e3da213003109a93acdfe20a5b3e202001a50c55845020")
depends=(
    "python-anytree"
    "python-structlog"
    "python-tabulate"
    "python-wimpy"
    "python-cachetools"
    "python-oyaml"
    "python-toml"
    "python-pip"
    "python-packaging"
    "python-wheel"
)

build () {
    cd "$pkgname-$pkgver"
    python3 setup.py build
}

package () {
    cd "$pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir" -O1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
