# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=django-htmx
pkgname=python-$_pyname
pkgver=1.19.0
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
sha256sums=('40c98d784948baf3f237a0407af614682e00c124df8a80f9d266321e4b8da0f9')

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
