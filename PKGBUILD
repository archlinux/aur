# Maintainer: Harriet O'Brien <harrietobrien@protonmail.com>

pkgname=python-skmatter
_pkgname=skmatter
pkgver=0.4.1
pkgrel=1
pkgdesc="A collection of scikit-learn compatible utilities for materials science and chemistry"
arch=('any')
url="https://github.com/scikit-learn-contrib/scikit-matter"
license=('BSD-3-Clause')
depends=(
    'python-scikit-learn'
    'python-scipy'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/06/5e/bae5ead0f4c2ca92475f300ed0c88ee9e9e976054a63e5ffe028de1fe6c2/skmatter-0.4.1.tar.gz")
sha256sums=('1d4e47369bb054aa7d609769dd6dd9609e03ec3a04a1a54393aaabd49fe8cd92')

build() {
    cd "${_pkgname}-${pkgver}"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
