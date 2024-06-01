# Maintainer: 1p22geo <1p22geodecki@gmail.com>
pkgname=python-libschrodinger
pkgver=1.2.3
pkgrel=1
arch=("any")
url="https://github.com/1p22geo/schrodinger"
license=('GPL')
depends=('python-numpy' 'python-scipy' 'python-matplotlib' 'ffmpeg')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/1p22geo/schrodinger/releases/download/v$pkgver/libschrodinger-$pkgver.tar.gz")
sha256sums=("6ff437412e097487e03dfa838bc8ff7bc9c0bd4894239ab19e95f222d38b87c9")

build() {
	cd "libschrodinger-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "libschrodinger-$pkgver"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
