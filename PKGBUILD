# Maintainer: Ozhan Gebesoglu <ozhan.gebesoglu@gmail.com>
pkgname=kishi-shell
pkgver=1.9.9
pkgrel=1
pkgdesc="A powerful, highly modular, Python-based modern TUI shell"
arch=('any')
url="https://github.com/ozhangebesoglu/Kishi-Shell"
license=('GPL-3.0-or-later')
depends=('python' 'python-prompt_toolkit' 'python-psutil')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ozhangebesoglu/Kishi-Shell/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('15644aec08d4d12a228cc446047dbc115a90909496903b88d7f19648ce75a16a')

build() {
    cd "Kishi-Shell-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "Kishi-Shell-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
