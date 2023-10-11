# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=duckargs
pkgname=python-duckargs
pkgver=1.2.0
pkgrel=1
pkgdesc="Productivity tool for quickly creating python programs that parse command-line arguments"
arch=(any)
url="https://github.com/eriknyquist/duckargs"
license=('APACHE')
depends=('python>=3.7')
makedepends=(python-build python-installer python-wheel)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('27d0f967091a8b3337d495cf5de5cfbe2f3aa5e01e46fbcdfb4db23b90422d208efec3952c562f3c2aa984844a96764be5c680dcf1d406c54f84e7ecce4f6cde')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
