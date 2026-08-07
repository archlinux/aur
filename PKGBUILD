# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=django-htmx
pkgname=python-$_pyname
pkgver=1.29.0
pkgrel=1
pkgdesc='Extensions for using Django with htmx'
arch=(any)
url="https://github.com/adamchainz/$_pyname"
license=(MIT)
depends=(python
         python-asgiref
         python-django)
makedepends=(python-{build,installer,wheel}
             python-uv-build)
checkdepends=(python-pytest)
_archive="$_pyname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('4f0e96ebccfe6e9b8c94dd4dfbb8348a7db881130dd0b9bcf38b5aa8379d4912')

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
