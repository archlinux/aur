# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-polyscope
pkgver=0.1.5
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
source=("https://files.pythonhosted.org/packages/69/05/7277bff210446b51944ea7eeca15ae0cfe33dbef9129c414f539523b41c8/polyscope-0.1.5.tar.gz")
sha256sums=('dc94f06e97ed929dfba00f92248af15ad8b15512a76b61b319b54074cead66da')

build(){
	cd "polyscope-${pkgver}"
	python setup.py build
}

package(){
	cd "polyscope-${pkgver}"
	python setup.py install --skip-build --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
