# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgver=0.38.4
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
sha512sums=('28a86cd63c3f934bfc01c05bcac21e56b480239926ccfb3421b23866e8a116b10f002ab278a4983b3d204d1f5868f5855fa2cf5357d2441711579480eecba340')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
sha512sums=('5a091161fe4ebc6ab33195029f86c01bae251eed94ebd3cf7b048eef8cf7b0f2d9adcb6cdd5f0f9be31dee9acfe533d9d5491101b9f16192eec58ace6fa210a7')
