# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgname=python-sphinx-substitution-extensions
pkgver=2025.01.02
pkgrel=2
pkgdesc='Extensions for Sphinx which allow for substitutions'
arch=(any)
url=https://github.com/adamtheturtle/sphinx-substitution-extensions
license=(Apache-2.0)
depends=(python-sphinx)
makedepends=(python-setuptools python-pip)
_name=${pkgname#python-}
source=(https://github.com/adamtheturtle/${_name}/archive/${pkgver}/${_name}-${pkgver}.tar.gz)
sha512sums=('412de63bba651d69fc2c9d38c9381621b7b5bb389ffe5ac5b517fc71d09bab16187872846e8f7c10a2d53970c887b6877541e2ca9d8ed0e9d7bd2ff9e9b0ef02')

build() {
    cd ${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_name}-${pkgver}
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
