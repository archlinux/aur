# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>

pkgname=python-textual_plotext
_name=${pkgname#python-}
pkgver=0.2.1
pkgrel=1
pkgdesc="A Textual widget wrapper for the Plotext plotting library"
url="https://github.com/Textualize/textual-plotext"
license=('MIT')
arch=('any')
depends=('python' 'python-plotext' 'python-textual')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
sha256sums=('bc6f2d75d8e20dda6321f8254dc3decda8f41f60e6e70a3ddd83b652b890c081')
