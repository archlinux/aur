# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=django-huey
pkgname=python-$_pyname
pkgver=1.3.1
pkgrel=1
pkgdesc='An extension for django and huey that supports multi queue management'
arch=(any)
url="https://github.com/gaiacoop/$_pyname"
license=(MIT)
depends=(python
         python-huey
         python-django)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
checkdepends=(python-pytest)
_archive="$_pyname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('c66ab67aed1bd5171e5a2c154cdcefccdc25356d7178185aa6bbd95b4c71c38d')

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
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENCE
}
