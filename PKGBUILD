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
sha256sums=('f778ea54c0209a136d9e436ccaed19037dc8b7e095286eaf2f1f816e01c31529')

build() {
    cd "Kishi-Shell-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "Kishi-Shell-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
