# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=antspy
pkgname=python-$_pkgname
pkgver=0.1.4
pkgrel=2
pkgdesc="Advanced Normalization Tools (ANTs) in Python"
arch=('any')
url="https://github.com/ANTsX/ANTsPy"
license=('apache')
depends=('python' 'python-numpy' 'python-webcolors' 'insight-toolkit')
optdepends=(
	'vtk: VTK support (re-build required)'
	'python-plotly: surface rendering')
makedepends=('python-setuptools' 'vtk')
source=("https://github.com/ANTsX/ANTsPy/archive/v${pkgver}.tar.gz")
sha512sums=('a3ca115f6aff931e05d3ff2311f305f2b751d7e21cada11da892204be781235f24e9ac7b89417b490d4a1403a0963f26686baee4c94afe8d251e24d2792fa025')

package() {
	cd "$srcdir/ANTsPy-$pkgver"

	export ITK_DIR="/usr"
	export VTK_DIR="/usr"

	# To enable VTK, pass the flag --vtk to the install script
	python setup.py install --optimize=1 --root="${pkgdir}"
}
