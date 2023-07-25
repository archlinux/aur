# Maintainer: Philipp A. <flying-sheep@web.de>
_name=pyRserve
pkgname=python-rserve
pkgver=1.0.3
pkgrel=1
pkgdesc='Python client to remotely access the R statistic package via network'
arch=(any)
url="https://github.com/ralhei/$_name"
license=(MIT)
depends=(python-numpy)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b96b439bc63ed45315eae2bcf7be5301444fc21f7632743538d2c438d287b286')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
