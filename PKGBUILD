# Maintainer: gilbus <aur (AT) tinkershell dot eu>
pkgname=potoo
_name=potoo
pkgver=0.1.0
pkgrel=1
pkgdesc="Markdown presentation tool build on top of textual"
arch=('any')
url="https://gitlab.com/gilbus/potoo"
license=('GPL3')
depends=('python-textual')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-pdm-backend')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4db34694f41438d5f60671ec7433d4d960ffa0f0a325505c7cd24a1ee30bd827')

prepare() {
	cd "$_name-$pkgver"
}

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
