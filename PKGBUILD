# Maintainer: Pierre Chapuis <arch@catwell.info>

pkgname="johnnydep"
pkgver=1.20.6
pkgrel=1
pkgdesc="Display dependency tree of Python distribution"
arch=("any")
url="https://github.com/wimglenn/johnnydep"
license=("MIT")
options=(!emptydirs)
source=("$pkgname-src-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("50b3bf1a0cdc43b4efdd4dbd4ee19bca7570ab2c1f68912c78486cde0ba601b6")
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
