# Maintainer: Joao Freitas <joaj dot freitas at gmail dot com>

pkgname=python-marko
_name=${pkgname#python-}
pkgver=2.0.1
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
sha256sums=('b59ecc64c2185bf5d5988a2c2a9afc8b6f72d9047896d120d4f32e14bb6c696d')


build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
