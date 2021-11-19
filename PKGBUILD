# Maintainer: Tomasz Zok <tomasz dot zok at gmail dot com>
pkgname=python-eltetrado
_name=${pkgname#python-}
pkgver=1.3.0
pkgrel=1
pkgdesc="Find and classify tetrads and quadruplexes in DNA/RNA 3D structures"
arch=(any)
url=https://github.com/tzok/eltetrado
license=(MIT)
depends=(python python-mmcif-pdbx python-numpy python-orjson)
makedepends=(python-setuptools)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('4ec0564dbf8b21151439af1fdeba513124e69d5e489e82f148f4cdaf27cc380e')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
