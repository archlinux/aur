# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-turkish-morphology
pkgver=1.2.5
pkgrel=5
pkgdesc='A two-level morphological analyzer for Turkish'
arch=(any)
url="https://github.com/google-research/${pkgname#python-}"
license=(Apache-2.0)
depends=(absl-py
         python
         python-protobuf)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="${pkgname#python-}-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('665fb87b7088650a561003aac793905565b816fd81cfed7fd01418ba0f05fad2')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
