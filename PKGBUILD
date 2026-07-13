# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=django-htmx
pkgname=python-$_pyname
pkgver=1.28.0
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
sha256sums=('d80f04973c3eb28ee4bc9feb0c82c0866a93ecbd236262a03a3f034d9505f0b8')

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
