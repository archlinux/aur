# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=django-htmx
pkgname=python-$_pyname
pkgver=1.21.0
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
sha256sums=('efa31a8acf31f1c8c284ae74979218fdfcabffee508618a102de58afcdae8fbc')

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
