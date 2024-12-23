# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-standardstreams
pkgver=0.2.0
pkgrel=5
pkgdesc='Standard output, standard error, and standard input stream library'
arch=(any)
url="https://github.com/chrissimpkins/${pkgname#python-}"
license=(MIT)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="${pkgname#python-}-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('93d418bf48c3cad0bd158f5be0814fd17af60f74780e43f2e53976d2fb03425c')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
