# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-polyscope
pkgver=0.1.6
pkgrel=1
pkgdesc="Python viewer and user interface for 3D data, like meshes and point clouds"
url="https://polyscope.run/py/"
license=(MIT)
arch=(i686 x86_64 armv7h aarch64)
depends=(gcc-libs libx11)
makedepends=(
	cmake
	libglvnd
	libxi
	libxcursor
	libxinerama
	libxrandr
	python-setuptools
)
source=("https://files.pythonhosted.org/packages/03/3b/a68d346ac6d03bafbd10ffb4076418824f51c32d1de254fad5741d5b5669/polyscope-0.1.6.tar.gz")
sha256sums=('4a040de27d65135e7caed1d3030e8299be363743183b4847ec229afcc67a3b4a')

build(){
	cd "polyscope-${pkgver}"
	python setup.py build
}

package(){
	cd "polyscope-${pkgver}"
	python setup.py install --skip-build --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
