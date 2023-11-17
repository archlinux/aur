# Maintainer: Joao Freitas <joaj dot freitas at gmail dot com>

pkgname=python-marko
_name=${pkgname#python-}
pkgver=2.0.2
pkgrel=3
pkgdesc='A markdown parser with high extensibility'
arch=('any')
url='https://pypi.org/project/marko'
license=('MIT')
depends=('python')
optdepends=()
makedepends=('python-build' 'python-pdm') 
provides=('python-marko')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('502df6d827139ea7265d819f4fe3664589f4774997eff758dc38bea4f52350e6')


build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
