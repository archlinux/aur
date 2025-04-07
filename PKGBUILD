# Maintainer: Joao Freitas <joaj dot freitas at gmail dot com>

pkgname=python-marko
_name=${pkgname#python-}
pkgver=2.1.3
pkgrel=1
pkgdesc='A markdown parser with high extensibility'
arch=('any')
url='https://pypi.org/project/marko'
license=('MIT')
depends=('python')
optdepends=()
makedepends=('python-build' 'python-pdm-backend')
provides=('python-marko')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('31aacb14867328f054cc39f884212907822a43d6a30cd75b0767e001a5e2f9fc')


build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
