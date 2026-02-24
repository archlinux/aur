pkgname=primer3-py
_name=primer3_py
pkgver=2.3.0
pkgrel=1
pkgdesc="Python-abstracted API for the popular Primer3 library. The intention is to provide a simple and reliable interface for automated oligo analysis and design."
arch=('any')
url="https://github.com/primer3-org/primer3"
license=('SPDX')
depends=('python' 'python-construct' 'cython')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('5f8bbc52d2981e6df47f7db0be7866fc')

build() {
	cd "$_name-$pkgver"
	python -m build
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dp -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dp -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
