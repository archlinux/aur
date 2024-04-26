# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>

_name=metadata
pkgname=python-tensorflow-$_name
pkgver=1.15.0
pkgrel=1
pkgdesc='Library and standards for schema and statistics.'
arch=(any)
url='https://github.com/tensorflow/metadata'
license=(Apache-2.0)
depends=(python absl-py python-googleapis-common-protos python-protobuf)
makedepends=(bazel python-build python-installer python-setuptools python-wheel)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('4feef4127335e7c3a2d8359f7366f044f11435ad1349653b5a215aa3d846ae72b67fe07ce22d0379b85848ba1db0ae9c7ec8fd09799023ff50fe2c81853b4b16')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
