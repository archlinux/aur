# Maintainer: shtrophic <aur at shtrophic dot net>

_name=pyRANSAC-3D
pkgname="python-pyransac3d"
pkgdesc="A python tool for fitting primitives 3D shapes in point clouds using RANSAC algorithm"
pkgver=0.6.0
pkgrel=1
arch=(any)
license=(Apache-2.0)
url="https://github.com/leomariga/$_name"
makedepends=('python-build' 'python-installer')
depends=('python' 'python-numpy')

source=("$pkgname-$pkgver.tar.gz::https://github.com/leomariga/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('135b84e9da916fd0bc0200e966294a8690d980ea1357f926c95fecdc3de73b161dc1de9ec5a5d3d1e9b0f80a462964c6b89b4abc4aa5512dceafd53d4930bed6')

_srcdir="$_name-$pkgver"

build() {
	cd $_srcdir
	python -m build --wheel --no-isolation
}

package() {
	cd $_srcdir
	python -m installer --destdir="$pkgdir" dist/*.whl
}

