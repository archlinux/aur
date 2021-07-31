# Maintainer: Philip Goto <philip.goto@gmail.com>

_pkgname=polyscope
pkgname=python-${_pkgname}
pkgver=1.2.0
pkgrel=1
pkgdesc='Python viewer and user interface for 3D data, like meshes and point clouds'
url='https://polyscope.run/py/'
license=(MIT)
arch=(x86_64 aarch64)
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
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f2071ecff08b66e094df8d12fc4fc3d671f307aac7086c749c3e7746f7428084')

build(){
	cd "polyscope-${pkgver}"
	python setup.py build
}

package(){
	cd "polyscope-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
