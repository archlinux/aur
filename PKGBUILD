# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 

pkgname=python-pyntcloud
pkgver=0.1.6
pkgrel=1
pkgdesc="Python library for working with 3D point clouds"
arch=("any")
license=("MIT")
url="https://github.com/daavoo/pyntcloud"
depends=('python' 'python-numpy' 'python-scipy' 'python-pandas')
optdepends=('python-laspy: LAS support' 
            'python-matplotlib: plotting support' 
            'python-pyvista: plotting support' 
            'ipython: plotting support' 
            'python-numba: numba acceleration support')
makedepends=()
source=("https://github.com/daavoo/pyntcloud/archive/v${pkgver}.tar.gz")
sha256sums=('ccd284f9413025ec34a369e0c76742e8b03fd803e26b8b1f837df81c5b70b3fe')

build() {
    cd "pyntcloud-${pkgver}"
    python setup.py build
}

package() {
    cd "pyntcloud-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/python-pyntcloud/LICENSE.md"
}
