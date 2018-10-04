# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=disptools
pkgname=python-$_pkgname
pkgver=0.4.0
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
sha256sums=('37bbbc083f70439953bab608fe882c24d281e6b773dbf821e294855ba1d6d522')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir" --opt
}
