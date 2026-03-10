# Maintainer: KevinCrrl

pkgname=kpa
pkgver=2.3.0
pkgrel=1
pkgdesc="KevinCrrl Python AUR Helper"
arch=('any')
url="https://github.com/KevinCrrl/kpa"
license=('GPL3-or-later')
source=("${url}/archive/refs/tags/${pkgver}/${pkgver}.tar.gz")
sha512sums=("")
conflicts=('kpa-bin')
depends=(
    'python'
    'python-pyxdg'
    'python-jsonschema'
    'python-colorama'
    'python-pkgbuild-parser'
    'python-requests'
    'python-typer'
    'git'
    'base-devel'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
)
optdepends=(
    'sudo: ejecutar comandos como root'
)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

