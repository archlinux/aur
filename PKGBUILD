# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=vsview-cli
_origpkgname=vsview_cli
pkgver=1.1.0
pkgrel=1
pkgdesc='Internal Rust-based CLI module for VSView.'
arch=('x86_64')
url='https://pypi.org/project/vsview-cli'
license=('Unlicense')
depends=(
    'python'
)
makedepends=(
    'python-build'
    'python-hatchling'
    'python-installer'
    'python-setuptools'
    'python-versioningit'
    'python-wheel'
    'python-maturin'
)
source=("https://files.pythonhosted.org/packages/source/v/${_origpkgname}/${_origpkgname}-${pkgver}.tar.gz")
sha256sums=('b119bdb559f64bd340afa8f6d0ab63d20cb2a01dc34e8e343391d8862558752b')

package() {
    cd "${_origpkgname}-${pkgver}" || exit
    python -m build --wheel --no-isolation
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm -rf "$pkgdir"/usr/lib/python*/site-packages/*.dist-info/sboms
}
