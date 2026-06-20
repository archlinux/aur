# Maintainer: Sadie K (zulc22)
pkgname=neostab
_name=${pkgname}
pkgver=0.1.1
pkgrel=1
pkgdesc='yaml-inspired fstab generator'
url='https://github.com/zulc22/neostab'
arch=(any)
license=('GPL-3.0-only')
depends=(python)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('f62289aeb544db019457852fc7d5db72e3febe34deb94bc593f7a0cf21153ce8')

makedepends=(python-build python-installer python-wheel python-hatchling)

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

