# Maintainer: Dringsim <dringsim@qq.com>

pkgname=python-tcl_kernel
_name=${pkgname#python-}
pkgver=0.0.5
pkgrel=2
pkgdesc="A Tcl kernel for Jupyter"
arch=('any')
url="https://github.com/ryanpepper/tcl_kernel"
license=('BSD')
makedepends=('python-build' 'python-installer' 'python-wheel')
depends=('python-jupyter-client' 'tcl')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('2758521AB96B16819D122763DE7E097D0BD11815C9537105495E97A848139D19')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}