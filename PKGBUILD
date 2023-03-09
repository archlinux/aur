# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor:  Joel Almeida <aullidolunar at gmail d0t k0m>

pkgname=python-ebooklib
_pkg=EbookLib
pkgver=0.18
pkgrel=1
pkgdesc='Python E-book library for handling books in EPUB2/EPUB3 format'
arch=('any')
url='https://github.com/aerkalov/ebooklib'
license=('AGPL3')
depends=('python-lxml' 'python-six')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('38562643a7bc94d9bf56e9930b4927e4e93b5d1d0917f697a6454db5a1c1a533')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
}
