# Maintainer: Sadie K (zulc22)
pkgname=neostab
_name=${pkgname}
pkgver=0.1.0
pkgrel=1
pkgdesc='yaml-inspired fstab generator'
url='https://github.com/zulc22/neostab'
arch=(any)
license=('GPL-3.0-only')
depends=(python)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('6db067926b3d3519667116c998ac65f852fb9b7450815de78a332be71782f8f3')

makedepends=(python-build python-installer python-wheel python-hatchling)

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

