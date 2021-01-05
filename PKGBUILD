# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-polyscope
pkgver=0.1.4
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
source=("https://files.pythonhosted.org/packages/4d/b5/e860c4803963b156dc8da66b19d08bc538df376a2be5458561e835040c37/polyscope-0.1.4.tar.gz")
sha256sums=('e7452f52c48bbef831af11e5faecdf16447e79d39d3685e85277dcaf63401dfc')

build(){
	cd "polyscope-${pkgver}"
	python setup.py build
}

package(){
	cd "polyscope-${pkgver}"
	python setup.py install --skip-build --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
