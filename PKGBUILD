# Maintainer:  Liam Timms <timms5000@gmail.com>
pkgname=python-looseversion
_name=${pkgname#python-}
pkgver=1.1.2
pkgrel=1
pkgdesc="Version numbering for anarchists and software realists"
arch=('any')
url='https://github.com/effigies/looseversion'
license=('PSFL2')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-flit')
optdepends=()
source=("${_name}-${pkgver}.tar.gz::https://github.com/effigies/${_name}/archive/${pkgver}.tar.gz")
md5sums=('901ec210a70289eca3a3be51678d3c21')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

