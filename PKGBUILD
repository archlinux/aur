# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=django-htmx
pkgname=python-$_pyname
pkgver=1.27.0
pkgrel=1
pkgdesc='Extensions for using Django with htmx'
arch=(any)
url="https://github.com/adamchainz/$_pyname"
license=(MIT)
depends=(python
         python-asgiref
         python-django)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
checkdepends=(python-pytest)
_archive="$_pyname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('541f54c6451a7a4a9365e47dcfc0c74fae4a7a9ea2f5bac0a7f0498b6c7d99d3')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	# pytest tests
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
