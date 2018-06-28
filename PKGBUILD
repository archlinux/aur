# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=disptools
pkgname=python-$_pkgname
pkgver=0.2.3
pkgrel=2
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
sha512sums=('9ef78d810a93bc5f5cec81077588f1200e602241edba57ad5baee5478cd6503cf109dce18ac2a39d7e979ff376966c0a192df616cd8f37606082b68ceb0716ad')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir" --opt
}
