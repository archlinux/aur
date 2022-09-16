_name=smart-progress
pkgname=python-$_name
pkgver=1.0.2
pkgrel=4
pkgdesc='Smart progressbar with multiple backends selected depending on the environment'
arch=('any')
url="https://github.com/flying-sheep/$_name"
license=(GPL3)
depends=(python jupyter python-click)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3a2ef36aa7d3846476d44fe436ad6be68bd384e3cea4655a6185bcc82a31d280')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
