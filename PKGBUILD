# Maintainer: Tomasz Zok <tomasz dot zok at gmail dot com>
pkgname=python-eltetrado
_name=${pkgname#python-}
pkgver=1.5.15
pkgrel=1
pkgdesc="Find and classify tetrads and quadruplexes in DNA/RNA 3D structures"
arch=(any)
url=https://github.com/tzok/eltetrado
license=(MIT)
depends=(python 'python-mmcif>=0.81' 'python-numpy>=1.26.1' 'python-orjson>=3.9.9' 'python-rnapolis>=0.1.4')
makedepends=(python-setuptools)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('ec3a02682693d3b16bd2e611898508def750a10ed72f56c5e0b569c5a2b1dfdf')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
