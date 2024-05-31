# Maintainer: 1p22geo <1p22geodecki@gmail.com>
pkgname=python-libschrodinger
pkgver=1.2.2
pkgrel=1
arch=("any")
url="https://github.com/1p22geo/schrodinger"
license=('GPL')
depends=('python-numpy' 'python-scipy' 'python-matplotlib' 'ffmpeg')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/1p22geo/schrodinger/releases/download/v$pkgver/libschrodinger-$pkgver.tar.gz")
sha256sums=("ff7bb79d5bd9bcafe1389bb1eb4416a97f6cae1647ab940689e8d4314762cd9c")

build() {
	cd "libschrodinger-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "libschrodinger-$pkgver"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
