# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=vsview-cli
_origpkgname=vsview_cli
pkgver=1.2.0
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
sha256sums=('cb983f4436a36f0f561ebc2e5d06280d1c9247564c1bcafc9c53fdf2c9c5417c')

package() {
    cd "${_origpkgname}-${pkgver}" || exit
    python -m build --wheel --no-isolation
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm -rf "$pkgdir"/usr/lib/python*/site-packages/*.dist-info/sboms
}
