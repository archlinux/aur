# Maintainer: Joao Freitas <joaj dot freitas at gmail dot com>

pkgname=python-marko
_name=${pkgname#python-}
pkgver=2.0.3
pkgrel=1
pkgdesc='A markdown parser with high extensibility'
arch=('any')
url='https://pypi.org/project/marko'
license=('MIT')
depends=('python')
optdepends=()
makedepends=('python-build' 'python-pdm') 
provides=('python-marko')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('3b323dcd7dd48181871718ac09b3825bc8f74493cec378f2bacaaceec47577d4')


build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
