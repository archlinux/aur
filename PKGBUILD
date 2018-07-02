# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=disptools
pkgname=python-$_pkgname
pkgver=0.3.0
pkgrel=1
pkgdesc="Generate displacement fields with known volume changes"
arch=('x86_64')
url="https://martinopilia.com/disptools"
license=('MIT')
depends=('python-numpy' 'python-scipy' 'python-simpleitk')
optdepends=('insight-toolkit: for disptools.drawing.sitk_to_itk (requires Python wrappers)'
            'python-itk: for disptools.drawing.sitk_to_itk (alternative to insight-toolkit)'
            'vtk: for disptools.io.write_vtk_points (requires Python wrappers)'
            'python-ply: for disptools.io.read_elastix_parameters')
makedepends=('python-setuptools')
source=("https://github.com/m-pilia/disptools/archive/v${pkgver}.tar.gz")
sha512sums=('9b6d6841bd662b719f61de9bf7c1d826be913c10861415a0ce0e493401c621878cc44d8b7a3df705a6bf42a42a7dcd656edf783cfbb0d44196c5e6ee7c9582e4')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir" --opt
}
