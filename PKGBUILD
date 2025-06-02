# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=django-huey
pkgname=python-$_pyname
pkgver=1.3.0
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
sha256sums=('13d2e0b5c20e94d037a92f4f4057ebed6f5af7b453cf1718dac6199b4006d754')

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
