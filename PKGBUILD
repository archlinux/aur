# Maintainer: Philip Goto <philip.goto@gmail.com>

_pkgname=polyscope
pkgname=python-${_pkgname}
pkgver=1.3.0
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
sha256sums=('63cd6583da984d817407417a4c3f4075de094a9f712b39a6a7caf24fa16b5659')

build(){
	cd "polyscope-${pkgver}"
	python setup.py build
}

package(){
	cd "polyscope-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
