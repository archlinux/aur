# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=disptools
pkgname=python-$_pkgname
pkgver=0.2.1
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
sha512sums=('1382e786f4ddc6b00a9dfafaf30747f8b53936e1ea3919425793882310d4ad2509871e5023b6b909b7d731e465e6be53dabf7c613d285581f8f96acb37b886fa')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
