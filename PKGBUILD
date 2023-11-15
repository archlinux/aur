# Maintainer: Tomasz Zok <tomasz dot zok at gmail dot com>
pkgname=python-eltetrado
_name=${pkgname#python-}
pkgver=1.5.16
pkgrel=1
pkgdesc="Find and classify tetrads and quadruplexes in DNA/RNA 3D structures"
arch=(any)
url=https://github.com/tzok/eltetrado
license=(MIT)
depends=(python 'python-mmcif>=0.81' 'python-numpy>=1.26.1' 'python-orjson>=3.9.10' 'python-rnapolis>=0.2.0')
makedepends=(python-setuptools)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('09710ff64471a398cd1f03b5b86a49e73339daba352683f10f14ee7f14239d58')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
