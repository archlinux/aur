# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>

_name=metadata
pkgname=python-tensorflow-$_name
pkgver=1.14.0
pkgrel=1
pkgdesc='Library and standards for schema and statistics.'
arch=(any)
url='https://github.com/tensorflow/metadata'
license=(Apache-2.0)
depends=(python absl-py python-googleapis-common-protos python-protobuf)
makedepends=(bazel python-build python-installer python-setuptools python-wheel)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('6340ddf36940bea62ef751dad1fb0e8b729a011677a4b0d7e472b223f0d4a9713abbd8e8648bd507aa227f522f96bba6346ab69884f48b561f8020d6b2fa2abc')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
