# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-turkish-morphology
pkgver=1.2.5
pkgrel=2
pkgdesc='A two-level morphological analyzer for Turkish'
arch=(any)
url="https://github.com/google-research/${pkgname#python-}"
license=(Apache)
depends=(absl-py
         python
         python-protobuf)
makedepends=(python-{build,installer}
             python-setuptools
             python-wheel)
_archive="${pkgname#python-}-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('665fb87b7088650a561003aac793905565b816fd81cfed7fd01418ba0f05fad2')

build() {
	cd "$_archive"
	python -m build
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
