# Maintainer: Ozhan Gebesoglu <ozhan.gebesoglu@gmail.com>
pkgname=kishi-shell
pkgver=2.0.0.6
pkgrel=1
pkgdesc="A powerful, highly modular, Python-based modern TUI shell"
arch=('any')
url="https://github.com/ozhangebesoglu/Kishi-Shell"
license=('GPL-3.0-or-later')
depends=('python' 'python-prompt_toolkit' 'python-psutil')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ozhangebesoglu/Kishi-Shell/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('024d535c0947fed2213f4f7f06097c959150e4ee5a1fabae16b343cc56cc2526')

build() {
    cd "Kishi-Shell-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "Kishi-Shell-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
