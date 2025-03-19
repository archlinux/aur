# Python package author: Francesco Caracciolo <francescocaracciolo78@gmail.com>
# Maintainer: Magi3r <magier dot mit dot f3erball at gmail dot com>

pkgname=python-livepng
_name=${pkgname#python-}
pkgver=0.1.8
pkgrel=3
pkgdesc="LivePNG is a format to create avatars based on PNG images with lipsync support"
arch=(any)
url="https://github.com/francescocaracciolo/livepng"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('3dd7ee7e45362beda48ad30628bdb53af8fcb1e9af2d3e817cef68e4c2082cf9')
license=(GGPLv3)
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
depends=("python-pydub")

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}
package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
