# Maintainer: 1p22geo <1p22geodecki@gmail.com>
pkgname=python-libschrodinger
pkgver=1.2.4
pkgrel=1
arch=("any")
url="https://github.com/1p22geo/schrodinger"
license=('GPL')
depends=('python-numpy' 'python-scipy' 'python-matplotlib' 'ffmpeg')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/1p22geo/schrodinger/releases/download/v$pkgver/libschrodinger-$pkgver.tar.gz")
sha256sums=("7c7b3f5b5016d16dd35d5c42f78f86eebc78d2631f99f68ce252a0767b40da30")

build() {
	cd "libschrodinger-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "libschrodinger-$pkgver"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
