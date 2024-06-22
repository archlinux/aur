# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=django-huey
pkgname=python-$_pyname
pkgver=1.2.1
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
sha256sums=('10cbde18f1a32fad3424af9404401b1ac331bbc28cf909a1e620b71eb36b2b51')

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
