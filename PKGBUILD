# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-argparse_dataclass
_name=${pkgname#python-}
pkgver=2.0.0
pkgrel=4
pkgdesc="Declarative CLIs with argparse and dataclasses"
arch=('any')
url="https://github.com/mivade/argparse_dataclass"
license=('MIT')
depends=(python-yaml)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('4840dc5c793bfeea4864371f21a341dcf6592047755f558c1c2814c0724b4119')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
