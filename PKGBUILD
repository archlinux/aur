# Maintainer: Tomasz Zok <tomasz dot zok at gmail dot com>
pkgname=python-eltetrado
_name=${pkgname#python-}
pkgver=1.5.18
pkgrel=1
pkgdesc="Find and classify tetrads and quadruplexes in DNA/RNA 3D structures"
arch=(any)
url=https://github.com/tzok/eltetrado
license=(MIT)
depends=(python 'python-mmcif>=0.81' 'python-numpy>=1.26.1' 'python-orjson>=3.9.10' 'python-rnapolis>=0.2.0')
makedepends=(python-setuptools)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('2e394298385a2a6120d6ec32f8a3773340eea23a70002c37097283ca208261ed')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
