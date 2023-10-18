# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=duckargs
pkgname=python-duckargs
pkgver=1.3.0
pkgrel=1
pkgdesc="Productivity tool for quickly creating python programs that parse command-line arguments"
arch=(any)
url="https://github.com/eriknyquist/duckargs"
license=('APACHE')
depends=('python>=3.7')
makedepends=(python-build python-installer python-wheel)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('712159a03452449389176f2f8afffa3d08005298d09c8f4e594965de7bfa5e1e35ce0d32ddea44652981b519cf5c1da0b29792184ba941615e610ecf49a48784')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
