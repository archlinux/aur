# Maintainer: KevinCrrl <kevincrrl@tuta.io>

pkgname=kpa
pkgver=3.0.1
pkgrel=1
pkgdesc="KevinCrrl Python AUR Helper: Creado para automatizar de manera segura."
arch=('any')
url="https://github.com/KevinCrrl/kpa"
license=('GPL-3.0-or-later')
source=("${url}/archive/refs/tags/${pkgver}/${pkgver}.tar.gz")
sha512sums=('4d90fec2331261b9cf0ce3661f3e8bef78862cc499ec3c79aa3ece1b8649349cf4872074074ce5b1b06ca1948345959fed398a72a6d077372001fe6a6753fc67')
depends=(
    'python'
    'python-pyxdg'
    'python-jsonschema'
    'python-pkgbuild-parser'
    'python-requests'
    'python-typer'
    'python-rich'
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

