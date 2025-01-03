# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgver=0.44.2
pkgrel=2
pkgname=python-pyvista
_name=${pkgname#python-}
pkgdesc='3D plotting and mesh analysis through a streamlined interface for VTK'
arch=('any')
url='https://www.pyvista.org'
license=('MIT')
depends=('python-numpy' 'python-pillow' 'python-pooch' 'python-scooby' 'vtk' 'python-matplotlib')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-meshio' 'xorg-server-xvfb' 'python-imageio')
source=("https://github.com/pyvista/pyvista/archive/v${pkgver}/pyvista-${pkgver}.tar.gz")
sha512sums=('a3e8a602083fc87f460387d577a33916399602bc06f0fff6f7268e683e678f319a5d9b38c16e1d56f00304b4175cbbaca18c1975f7b6911279eeb159453c57be')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
