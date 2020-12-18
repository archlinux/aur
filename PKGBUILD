# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-polyscope
pkgver=0.1.3
pkgrel=1
pkgdesc="Python viewer and user interface for 3D data, like meshes and point clouds"
url="https://polyscope.run/py/"
license=(MIT)
arch=(i686 x86_64 armv6h armv7h)
depends=(gcc-libs libx11)
makedepends=(cmake libglvnd libxi libxcursor libxinerama libxrandr python-setuptools)
source=("https://files.pythonhosted.org/packages/2b/26/15582912c5e189bf1e98c05987f8a9e1ecab17a39b4e1d5764ffa60440cc/polyscope-0.1.3.tar.gz")
sha256sums=('32112ad4174668e067fb0c4de71b8340e96219c2a5e7bfab4a0ca75206672035')

build(){
	cd "polyscope-${pkgver}"
	python setup.py build
}

package(){
	cd "polyscope-${pkgver}"
	python setup.py install --skip-build --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
