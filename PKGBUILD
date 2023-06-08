# Maintainer:  Liam Timms <timms5000@gmail.com>
# Contributor: mark.blakeney at bullet-systems dot net
pkgname=python-looseversion
_name=${pkgname#python-}
pkgver=1.2.0
pkgrel=1
pkgdesc="Version numbering for anarchists and software realists"
arch=('any')
url='https://github.com/effigies/looseversion'
license=('PSFL2')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-flit' 'python-hatchling')
source=("${_name}-${pkgver}.tar.gz::https://github.com/effigies/${_name}/archive/${pkgver}.tar.gz")
md5sums=('dd279fe74ae0df00039da30a21245f25')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

