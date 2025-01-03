# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgname=python-yaml2rst
pkgver=0.3
pkgrel=3
pkgdesc='A Simple Tool and Python-Module for Documenting YAML Files'
arch=(any)
url='https://github.com/debops/yaml2rst'
license=('GPL-3.0-or-later')
makdepends=('python-setuptools')
_name=${pkgname#python-}
source=("https://github.com/debops/${_name}/archive/v${pkgver}/${_name}-${pkgver}.tar.gz")
sha512sums=('0c82d1965afabad48230fab8bb100fc5a61e39c274171f410927e239507a1eb2af75c9b907e78dde24df98596debc02f2a282d6dcfddd8f4c4d3f2c0cbd450fa')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
