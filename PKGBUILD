# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>

pkgname=python-largestinteriorrectangle
_name=${pkgname#python-}
_shortname=lir
pkgver=0.2.0
pkgrel=6
pkgdesc="Largest Interior/Inscribed Rectangle implementation in Python"
arch=('any')
url="https://github.com/OpenStitching/lir"
license=('Apache-2.0')
depends=('python-opencv' 'python-numba' 'python-numpy')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ffac62a19b9fdb581c74ae4b8e96834d0baef847cce75443c78feeff1d1045ce')

build() {
    cd "$_shortname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_shortname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
