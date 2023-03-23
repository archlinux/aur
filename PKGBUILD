# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgver=0.38.5
pkgrel=1
pkgname=python-pyvista
_name=${pkgname#python-}
pkgdesc='3D plotting and mesh analysis through a streamlined interface for the Visualization Toolkit (VTK)'
arch=('any')
url='https://www.pyvista.org'
license=('MIT')
depends=('python-numpy' 'python-imageio' 'python-pillow' 'python-appdirs' 'python-scooby' 'vtk')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('python-meshio')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('51d785259fa2a0ff79bfbb5b1db764a49c13724562e5882295ea05ce1100043c68a1f730bc2188df7e28f0f5d6a1958b9cadec021c58d046c1b586b38d1a469f')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
